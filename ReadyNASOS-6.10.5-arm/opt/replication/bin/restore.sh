#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <job.path> <empty> <log.guid>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/restore.log"

RCOPY_DONE=$NO

#
# arg: <log.guid>
#
set_vars()
{
    JOB_STATE="UNDEFINED"
    LOG_GUID="${1}"
    return $OK
}

#
# arg:
#
setup_rsync()
{
    COPY_EXEC="${RSYNC} --guid-log \"${LOG_FOLDER}/${LOG_GUID}\" --guid-job \"${LOG_FOLDER}/${JOB_GUID}\" --timeout=1200 -a -H --relative --force --delete-during --iconv=UTF-8"
    [ -r "${SYS_PREFIX}/etc/rsyncd.excl" ] && COPY_EXEC="${COPY_EXEC} --exclude-from=${SYS_PREFIX}/etc/rsyncd.excl"
    [ "x${JOB_COMPRESS}" == "xtrue" ] && COPY_EXEC="${COPY_EXEC} -z"

    [ $CONNECT_TYPE -eq $CONNECT_TYPE_LOCAL ] && {
	log_inf "Job is local"
	return $OK
    }

    [ $CONNECT_TYPE -eq $CONNECT_TYPE_LAN ] && {
	log_inf "LAN connection available"
	if get_rsync_credentials;
	then
	    log_inf "Using LAN connection"
	    RSYNC_PASSWORD="${RSYNC_LAN_PASS}"
	    export RSYNC_PASSWORD
	    COPY_EXEC="${COPY_EXEC} -W"
	    return $OK
	else
	    CONNECT_TYPE=${CONNECT_TYPE_P2P}
	    DATA_IP="${TASK_IP}"
	    log_inf "Fall back to p2p connection"
	    return $OK
	fi
    }
    log_inf "LAN connection not available"
    log_inf "Using p2p connection"
    CONNECT_TYPE=${CONNECT_TYPE_P2P}
    DATA_IP="${TASK_IP}"
    return $OK
}

#
# arg: <job.path>
#
load_job()
{
    local job="$1"

    JOB_GUID=$(rxml ${job} /job/guid)
    JOB_NETID=$(rxml ${job} /job/netid)
    JOB_NAME=$(rxml ${job} /job/name)
    JOB_COMPRESS=$(rxml ${job} /job/compress)
    JOB_CLEAN=$(rxml ${job} /job/clean)
    JOB_SYS=$(rxml ${job} /job/sys)
    JOB_REF=$(rxml ${job} /job/ref)
    JOB_SOURCE=($(rxml ${job} /job/source))
    JOB_DESTINATION=($(rxml ${job} /job/destination))

    rm -f "${job}" >/dev/null 2>&1

    P2P_PEER=${JOB_DESTINATION#//}
    P2P_PEER=${P2P_PEER%%/*}

    RESTORE_FOLDER=${JOB_DESTINATION#//${P2P_PEER}}
    RESTORE_FOLDER=${RESTORE_FOLDER#/}

    BACKUP_FOLDER=${JOB_REF#//}
    BACKUP_FOLDER=${BACKUP_FOLDER#*/}

    local i=0
    for item in ${JOB_SOURCE[@]}
    do
	JOB_SOURCE_DATA_ITEMS[i++]=${item#${JOB_REF}*/data/}
    done

    RESTORE_POINT="${JOB_SOURCE[0]%${JOB_SOURCE_DATA_ITEMS[0]}}"
    RESTORE_POINT="${RESTORE_POINT#//}"
    RESTORE_POINT="${RESTORE_POINT#*/}"
    JOB_SOURCE_CONF="${RESTORE_POINT%data/}configs.zip"

    # print
    echo "P2P_PEER        ${P2P_PEER}"
    echo "RESTORE_FOLDER  ${RESTORE_FOLDER}"
    echo "BACKUP_FOLDER   ${BACKUP_FOLDER}"
    echo "RESTORE_POINT   ${RESTORE_POINT}"
    echo "JOB_SOURCE_CONF ${JOB_SOURCE_CONF}"
    for item in ${JOB_SOURCE_DATA_ITEMS[@]}
    do
	echo "* ${item}"
    done
}

#
# arg: <ref.path> <sources>
#
do_item_restore()
{
    pushd "/${1}" >/dev/null 2>&1
    local command="${COPY_EXEC} --stats --progress ${2}"
    if [ $CONNECT_TYPE -eq $CONNECT_TYPE_LAN ];
    then
	command="${command} \"rsync://${RSYNC_LAN_USER}@${DATA_IP}:${RSYNC_LAN_PORT}/restore/${RESTORE_FOLDER}\""
    else
	command="${command} \"rsync://${DATA_IP}:${RSYNC_PORT}/restore/${RESTORE_FOLDER}\""
    fi
    local res=$OK
    eval "${command}" || res=$ERROR
    popd >/dev/null 2>&1
    return ${res}
}

#
# arg:
#
do_restore()
{
    [ "x${JOB_SYS}" == "xtrue" ] && {
	get_volumes || return $ERROR
    }

    local src=""
    for item in ${JOB_SOURCE_DATA_ITEMS[@]}
    do
	[ "x${JOB_SYS}" == "xtrue" ] && {
	    local ad=$NO
	    local iv=${item%%/*}
	    for tv in ${TARGET_VOLUMES[@]}
	    do
		[ "x${iv}" == "x${tv}" ] && {
		    src="${src} \"$(echo "${item}" | escape -s)\""
		    ad=$YES
		    break
		}
	    done
	    [ ${ad} -eq $NO ] && log_warn "Item \"${item}\" skipped"
	} || src="${src} \"$(echo "${item}" | escape -s)\""
    done

    src=${src# }
    [ -n "${src}" ] && {
	log_inf "Copy in progress"
	do_item_restore "${RESTORE_POINT}" "${src}"

	if grep -Fxq "Exit code: 0 (Ok)" "${LOG_FOLDER}/${LOG_GUID}.summ"
	then
	    log_inf "Copy finished"
	    RCOPY_DONE=$YES
	else
	    log_err "Copy failed"
	    RCOPY_DONE=$NO
	    return $ERROR
	fi
    }
    return $OK
}

#
# arg: -
#
pre_process()
{
    log_dbg "Set job state to ACTIVE"
    JOB_STATE="ACTIVE"
    send_job_state "${JOB_GUID}" "${JOB_STATE}"
    p2p_connect "${JOB_NETID}" "${P2P_PEER}" || return $ERROR
    setup_rsync
    return $OK
}

#
# arg: [<opt{cancel|pause}>]
#
post_process()
{
    case "x${1}" in
	"xcancel")
	    FINAL_JOB_STATUS="CANCELLED"
	    ;;
	"xpause")
	    FINAL_JOB_STATUS="PAUSED"
	    ;;
	*)
	    [[ ${RCOPY_DONE} -eq $YES ]] && FINAL_JOB_STATUS="SUCCESS" || FINAL_JOB_STATUS="FAILED"
	    ;;
    esac

    p2p_disconnect "${JOB_NETID}" "${P2P_PEER}"

    [ "x${JOB_STATE}" == "xACTIVE" ] && log_dbg "Set job state to FINISHED"

    log_inf "Job finished"

    $SYS_PREFIX/bin/report.sh "${FINAL_JOB_STATUS}" "${JOB_GUID}" "${LOG_GUID}"

    [ "x${JOB_STATE}" == "xACTIVE" ] && {
	JOB_STATE="FINISHED"
	send_job_state "${JOB_GUID}" "${JOB_STATE}"
    }
}

cancel()
{
    log_err "Job cancelled"
    sleep 5
    post_process "cancel"
    exit $OK
}

pause()
{
    log_err "Job paused"
    sleep 5
    post_process "pause"
    exit $OK
}

###########################################################

trap cancel USR1
trap pause  USR2

[ $# -lt 2 ] && exit $ERROR

load_job "${1}" || exit $ERROR
set_vars "${3}"

log_init "${LOG_FOLDER}/${LOG_GUID}.log"

log_inf "Replicate addon version: $(rxml ${SYS_PREFIX}/etc/version.xml /Version/Current) build $(rxml ${SYS_PREFIX}/etc/version.xml /Version/Build)"
log_inf "Starting restore job \"${JOB_NAME}\""

pre_process && {
    [ "x${JOB_SYS}" == "xtrue" ] && do_conf_restore
    do_restore
}
post_process

exit $OK
