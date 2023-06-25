#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: "<action{schedule:run:runnow:cancel:pause:resume}>:<job.guid>[:<resume.folder>]"
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/jobcmd.log"

JOBCMD_LOCK="${SYS_PREFIX}/var/run/jobcmd.lock"

#
# arg: <job.guid>
#
do_schedule()
{
    local guid="${1}"
    local job_path="${JOB_FOLDER}/${guid}.job"
    fetch_job "${guid}" "${job_path}" || {
	rm -f "${job_path}"
	return $ERROR
    }
    local res=$(cat "${job_path}")
    [ "x${res}" == "xFAIL" ] && {
	do_delete "${guid}"
	rm -f "${job_path}"
	return $OK
    }
    local type=$(rxml "${job_path}" /job/type 2>/dev/null)
    [ "x${type}" == "xbackup" ] && {
	local scheduler=$(rxml "${job_path}" /job/scheduler)
	rm -f "${job_path}"
	local crontab_line="${scheduler} $(whoami) ${SYS_PREFIX}/bin/jobcmd.sh run:${guid}"
	# check if it is already present with same schedule
	local lines=($(cat ${CRONTAB}))
	for line in ${lines[@]}
	do
	    [ "${line}" == "${crontab_line}" ] && return $OK
	done
	# reschedule
	cat ${CRONTAB} | grep -v "${guid}$" > ${CRONTAB_TMP}
	echo "${crontab_line}" >> ${CRONTAB_TMP}
	mv ${CRONTAB_TMP} ${CRONTAB}
	sleep 2
	send_job_state "${guid}" "PENDING"
	return $OK
    }
    rm -f "${job_path}"
    return $ERROR
}

#
# arg: <sig> <pid>
#
killtree()
{
    kill $1 $2
    for child in $(ps -o pid= --ppid $2); do
        killtree $1 ${child}
    done
}

#
# arg: <job.guid>
#
do_cancel()
{
    local guid="${1}"
    local pid=$(ps ax | grep "${guid}.job" | grep -v grep | awk '{print $1}' | head -1)
    if [ -z "${pid}" ]
    then
        local job_path="${JOB_FOLDER}/${guid}.job"
        fetch_job "${guid}" "${job_path}" || {
            rm -f "${job_path}"
            return $OK
	}
	local type=$(rxml "${job_path}" /job/type 2>/dev/null)
	if [ "x${type}" == "xrestore" ]
	then
	    send_job_state "${guid}" "FINISHED"
	else
	    send_job_state "${guid}" "PENDING"
	fi
    else
	IFS=$IFS_DEFAULT
	killtree -USR1 "${pid}"
	IFS=$IFS_NEWLINE
    fi
    return $OK
}

#
# arg: <job.guid>
#
do_pause()
{
    local guid="${1}"
    local pid=$(ps ax | grep "${guid}.job" | grep -v grep | awk '{print $1}' | head -1)
    if [ -n "${pid}" ]
    then
        local job_path="${JOB_FOLDER}/${guid}.job"
        fetch_job "${guid}" "${job_path}" || {
	    rm -f "${job_path}"
	    return $OK
	}
	local type=$(rxml "${job_path}" /job/type 2>/dev/null)
	if [ "x${type}" == "xrestore" ];
	then
	    send_job_state "${guid}" "FINISHED"
	else
	    send_job_state "${guid}" "PENDING"
	fi
    else
	IFS=$IFS_DEFAULT
	kill -USR2 $pid
	killchilds -USR1 $pid
	IFS=$IFS_NEWLINE
    fi
    return $OK
}

#
# arg: <job.guid>
#
do_delete()
{
    local guid="${1}"
    local job_path="${JOB_FOLDER}/${guid}.job"
    cat ${CRONTAB} | grep -v "${guid}$" > ${CRONTAB_TMP}
    mv ${CRONTAB_TMP} ${CRONTAB}
    rm -f "${job_path}"
    report_spool_remove "${guid}"
}

#
# arg: <job.guid>
#
do_run()
{
    local job_guid="${1}"
    local job_path="${JOB_FOLDER}/${job_guid}.job"
    local log_guid="$(uuid)"
    local log_path="${LOG_FOLDER}/${log_guid}.log"

    log_init "${log_path}"
    log_dbg "Updating job with id ${job_guid} from server"

    JOB_UPDATED=$NO
    if fetch_job "${job_guid}" "${job_path}";
    then
        log_inf "Job updated from server"
	file_cache_put "${job_path}" "${job_guid}" && log_dbg "Local cache updated"
	JOB_UPDATED=$YES
    else
	log_warn "Unable to update job from server"
	file_cache_get "${job_guid}" "${job_path}" || {
	    log_dbg "Unable to get job from local cache"
	    rm -f "${log_path}"
	    return $ERROR
	}
	log_warn "Get job from local cache"
    fi

    [ "x$(cat "${job_path}")" == "xFAIL" ] && {
	do_delete "${job_guid}"
	return $OK
    }
    local enabled=$(rxml "${job_path}" /job/enabled)
    [ "x${enabled}" == "xfalse" ] && {
        rm -f "${job_path}"
        return $OK
    }
    local type=$(rxml "${job_path}" /job/type)
    [ "x${type}" == "xbackup" ] && {
	local startdate=$(rxml "${job_path}" /job/startdate)
	# make offset for timezone
	tz_offset=$(date +%z)
	tz_offset_sign=${tz_offset%????}
	tz_offset_hours=${tz_offset%??}
	tz_offset_hours=${tz_offset_hours#?}
	tz_offset_hours=${tz_offset_hours#0}
	tz_offset_minutes=${tz_offset#???}
	tz_offset_sign=${tz_offset_sign}1
	tz_offset_milliseconds=$(( $tz_offset_hours * 60 * 60 * 1000 + tz_offset_minutes * 60 * 1000 ))
	let tz_offset_milliseconds*=$tz_offset_sign
	let startdate-=${tz_offset_milliseconds}

	local currdate=$(date +'%s000')

	[ $currdate -lt $startdate ] && {
	    rm -f "${job_path}"
	    return $OK
	}
    }
    local skipped=$(rxml "${job_path}" /job/skipped)
    [[ ${JOB_UPDATED} -eq $YES && "x${skipped}" == "xtrue" ]] && {
	rm -f "${job_path}"
	return $OK
    }
    local handler="${type}.sh"
    nohup ${SYS_PREFIX}/bin/${handler} "${job_path}" "" "${log_guid}" >/dev/null 2>&1 &
    #${SYS_PREFIX}/bin/${handler} "${job_path}" "" "$(uuid)" 2>&1
    return $OK
}

#
# arg: <job.guid>
#
do_runnow()
{
    local guid="${1}"
    local job_path="${JOB_FOLDER}/${guid}.job"
    fetch_job "${guid}" "${job_path}" || {
	rm -f "${job_path}"
	return $ERROR
    }
    # do not check any skip/enable flags
    local type=$(rxml "${job_path}" /job/type)
    local handler="${type}.sh"
    nohup ${SYS_PREFIX}/bin/${handler} "${job_path}" "" "$(uuid)" >/dev/null 2>&1 &
    #${SYS_PREFIX}/bin/${handler} "${job_path}" "" "$(uuid)" 2>&1
    return $OK
}

#
# arg: <msg.guid> <job.guid>
#
do_getstat()
{
    local file="${LOG_FOLDER}/${2}.stat"
    local p=$(ps ax | grep "$2.job" | grep -v grep)
    local log="${LOG_FOLDER}/${p##* }.log"

    local DATA="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    DATA="${DATA}<request moniker=\"/root/devices\" method=\"sendstat\">"
    DATA="${DATA}<body type=\"jobstat\">"
    DATA="${DATA}<guid>${1}</guid><value><![CDATA["
    [ -e "${file}" ] && DATA="${DATA}$(cat ${file})"
    [ -e "${log}" ] && {
	local l=$(tail -n 1 ${log})
	DATA="${DATA}<log>$(echo "${l}" | escape -x)</log>"
    }
    DATA="${DATA}]]></value></body></request>"
    comm_post_data "${DATA}" || return $ERROR
    return $OK
}

#
# arg: <msg.guid> <resume.folder>
#
do_resume()
{
    local guid="${1}"
    local resume_folder="${2}"
    local job_path="${JOB_FOLDER}/${guid}.job"
    fetch_job "${guid}" "${job_path}" || {
	rm -f "${job_path}"
	return $ERROR
    }
    # do not check any skip/enable flags
    local type=$(rxml "${job_path}" /job/type)
    local handler="${type}.sh"
    nohup ${SYS_PREFIX}/bin/${handler} "${job_path}" "${resume_folder}" "$(uuid)" >/dev/null 2>&1 &
    #${SYS_PREFIX}/bin/${handler} "${job_path}" "${resume_folder}" "$(uuid)" 2>&1
    return $OK
}

#########################################

[ $# != 1 ] && {
    exit $ERROR
}

# crontab files
CRONTAB="${SYS_PREFIX}/etc/cron.d/replication"
CRONTAB_TMP="${SYS_PREFIX}/etc/cron.d/replication.tmp"
touch ${CRONTAB}

chop=$(echo "${1}" | tr -d '\015')
IFS=$IFS_COLON
arg=(${chop})
action="${arg[0]}"
guid0="${arg[1]}"
guid1="${arg[2]}"
IFS=$IFS_NEWLINE

# execute action
case "${action}" in
    "schedule")
	(flock -e 200 && do_schedule "${guid0}") 200>"${JOBCMD_LOCK}"
	;;
    "cancel")
	do_cancel "${guid0}"
	;;
    "run")
	do_run "${guid0}" && sleep 5
	;;
    "runnow")
	do_runnow "${guid0}"
	;;
    "getstat")
	do_getstat "${guid0}" "${guid1}"
	;;
    "pause")
	do_pause "${guid0}"
	;;
    "resume")
	do_resume "${guid0}" "${chop#${action}:${guid0}:}"
	;;
    *)
	exit $ERROR
	;;
esac

exit $OK
