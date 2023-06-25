#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

SNAP_DONE=$NO

#
# arg: <task.path>
#
send_task()
{
    log_inf "Sending task to source device"

    #local command="${RSYNC} --timeout=90 -aq --iconv=UTF-8 -T /tmp \"${1}\" \"rsync://${TASK_IP}:${RSYNC_PORT}/tasks\""
    #echo "${command}"
    local command="${RSYNC} --timeout=90 -aq --iconv=UTF-8 -T /tmp \"${1}\" \"rsync://${TASK_IP}:${RSYNC_PORT}/tasks\" >/dev/null 2>&1"
    eval "${command}" || {
	sleep 5
	eval "${command}" || {
	    log_err "Unable to send task"
	    return $ERROR
	}
    }
    return $OK
}

#
# arg: <timeout.seconds> <report.path>
#
wait_task()
{
    log_inf "Awaiting task report"
    local timeout=${1}
    local report="${2}"
    for ((i=0; i<${timeout}; i++))
    do
	[ -e "${report}" ] && {
	    local succeed=$(rxml "${report}" /report/@succeed)
	    local messages=($(rxml "${report}" /report/messages/msg))
	    local errors=($(rxml "${report}" /report/errors/err))
	    if [ "x${succeed}" == "xtrue" ];
	    then
		log_inf "Received success report"
		res=$OK
	    else
		log_err "Received failed report"
		res=$ERROR
	    fi
	    for message in ${messages[@]}
	    do
	        log_warn "${message}"
	    done
	    for error in ${errors[@]}
	    do
	        log_err "${error}"
	    done
	    return $res
	}
	sleep 1
    done
    log_err "Report was not received in 2 min"
    return $ERROR
}

#
# arg:
#
get_rsync_credentials()
{
    log_inf "Get LAN credentials"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"info\">"
    TASK="${TASK}<action>get_rsync_credentials</action>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}</task>"
    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Get LAN credentials failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
	log_warn "Get LAN credentials failed"
	rm -f "${report}" >/dev/null 2>&1
	return $ERROR
    }
    RSYNC_LAN_USER="$(rxml "${report}" /report/rsync_credentials/user)"
    RSYNC_LAN_PASS=$(rxml "${report}" /report/rsync_credentials/pass)
    rm -f "${report}" >/dev/null 2>&1
    return $OK
}

#
# arg:
#
do_conf_backup()
{
    [ "x${JOB_SYS}" == "xfalse" ] && return $OK

    log_inf "Starting system config backup"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local config="${TMP_FOLDER}/${uuid}.zip"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"configs\">"
    TASK="${TASK}<action>backup</action>"
    TASK="${TASK}<config>rsync://${MINE_IP}:${RSYNC_PORT}/temp/${uuid}.zip</config>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}</task>"
    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Backup configs failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
	log_err "Backup configs failed"
	rm -f "${report}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${report}" >/dev/null 2>&1
    mv "${config}" "${BACKUP_PATH_TEMP}/configs.zip" && {
	return $OK
    }
    log_err "Unable to backup configs"
    return $ERROR
}

#
# arg:
#
do_conf_restore()
{
    log_inf "Starting system configs restore"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local config="${TMP_FOLDER}/${uuid}.zip"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"configs\">"
    TASK="${TASK}<action>restore</action>"
    TASK="${TASK}<config>rsync://${MINE_IP}:${RSYNC_PORT}/restore/${JOB_SOURCE_CONF}</config>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}</task>"
    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Restore configs failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
        log_err "Restore configs failed"
        rm -f "${report}" >/dev/null 2>&1
        return $ERROR
    }
    rm -f "${report}" >/dev/null 2>&1
    return $OK
}

#
# arg:
#
create_snapshot()
{
    log_inf "Initializing source device"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"snapshot\">"
    TASK="${TASK}<action>create</action>"
    TASK="${TASK}<guid>${JOB_GUID}</guid>"
    TASK="${TASK}<size>${JOB_SNAP_SIZE}</size>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}<items>"
    for item in ${JOB_SOURCE_DATA_ITEMS[@]}
    do
	TASK="${TASK}<item>${item}</item>"
    done
    TASK="${TASK}</items>"
    TASK="${TASK}</task>"

    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Device initialization failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
	log_err "Device initialization failed"
	rm -f "${report}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${report}" >/dev/null 2>&1
    SNAP_DONE=$YES
    log_inf "Device initialization finished"
    return $OK
}

#
# arg:
#
delete_snapshot()
{
    [ ${SNAP_DONE} -eq $NO ] && return $OK

    log_inf "Deinitialize source device"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"snapshot\">"
    TASK="${TASK}<action>delete</action>"
    TASK="${TASK}<guid>${JOB_GUID}</guid>"
    TASK="${TASK}<size>${JOB_SNAP_SIZE}</size>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}<items>"
    for item in ${JOB_SOURCE_DATA_ITEMS[@]}
    do
	TASK="${TASK}<item>${item}</item>"
    done
    TASK="${TASK}</items>"
    TASK="${TASK}</task>"
    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Device deinitialization failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
	log_err "Device deinitialization failed"
	rm -f "${report}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${report}" >/dev/null 2>&1
    log_inf "Device deinitialization finished"
    return $OK
}

#
# arg: -
#
get_volumes()
{
    log_inf "Request target device volumes"
    local uuid=$(uuid)
    local task="${TMP_FOLDER}/${uuid}.task"
    local report="${TMP_FOLDER}/${uuid}.report"

    local TASK="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    TASK="${TASK}<task type=\"snapshot\">"
    TASK="${TASK}<action>getvolumes</action>"
    TASK="${TASK}<report>rsync://${MINE_IP}:${RSYNC_PORT}/reports/${uuid}.report</report>"
    TASK="${TASK}</task>"
    echo "${TASK}" > "${task}"
    send_task "${task}" || {
	log_err "Get target device volumes failed"
	rm -f "${task}" >/dev/null 2>&1
	return $ERROR
    }
    rm -f "${task}" >/dev/null 2>&1
    wait_task 120 "${report}" || {
        log_err "Unable to get volumes"
        rm -f "${report}" >/dev/null 2>&1
        return $ERROR
    }
    TARGET_VOLUMES=$(rxml "${report}" /report/volumes/item)
    rm -f "${report}" >/dev/null 2>&1
    log_inf "Target device volumes received"
    return $OK
}
