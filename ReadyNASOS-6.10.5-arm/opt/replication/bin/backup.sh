#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <job.path> <resume.folder> <log.guid>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/backup.log"

RCOPY_DONE=$NO
HCOPY_DONE=$NO
LOCK_DONE=$NO
CONN_DONE=$NO

#
# arg: <job.path>
#
load_job()
{
    local job="${1}"
    JOB_GUID=$(rxml ${job} /job/guid)
    JOB_NAME=$(rxml ${job} /job/name)
    JOB_STARTDATE=$(rxml ${job} /job/startdate)
    JOB_NETID=$(rxml ${job} /job/netid)
    JOB_SYS=$(rxml ${job} /job/sys)
    JOB_SOURCE=($(rxml ${job} /job/source))
    JOB_DESTINATION=($(rxml ${job} /job/destination))
    JOB_ROTATE=$(rxml ${job} /job/rotate)
    JOB_CLEAN=$(rxml ${job} /job/clean)
    JOB_COMPRESS=$(rxml ${job} /job/compress)
    JOB_SNAP_SIZE=$(rxml ${job} /job/snapsize)
    [ -z "${JOB_SNAP_SIZE}" ] && JOB_SNAP_SIZE=2

    rm -f "${job}" >/dev/null 2>&1

    # figure out p2p peer
    P2P_PEER=${JOB_SOURCE#//}
    P2P_PEER=${P2P_PEER%%/*}

    # split items
    local i=0
    for item in ${JOB_SOURCE[@]}
    do
	JOB_SOURCE_DATA_ITEMS[++i]=${item#//${P2P_PEER}}
    done

    # local path
    JOB_DESTINATION_PATH="/${JOB_DESTINATION#//*/}"
    return $OK
}

#
# arg: <resume.folder> <log.guid>
#
set_vars()
{
    JOB_STATE="UNDEFINED"
    RESUME_FOLDER="${1}"
    LOG_GUID="${2}"
    TARGET_PATH="${JOB_DESTINATION_PATH}/${JOB_NAME}"
    BACKUP_LOCK="${TARGET_PATH}/backup.lock"
    BACKUP_PATH="${TARGET_PATH}/$(date +'%Y-%m-%d %H-%M')"
    BACKUP_PATH_TEMP="${BACKUP_PATH} (in process)"
    BACKUP_CONF_PATH="${BACKUP_PATH_TEMP}"
    BACKUP_DATA_PATH="${BACKUP_PATH_TEMP}/data"
    BACKUP_DATA_TEMP="${BACKUP_PATH_TEMP}/${JOB_GUID}"
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
# arg: <sources>
#
do_item_backup()
{
    local command="${COPY_EXEC} --stats --progress ${1} \"$(echo "${BACKUP_PATH_TEMP}" | escape -s)\""
    eval "${command}" || return $ERROR
    return $OK
}

#
# arg:
#
do_backup()
{
    #return $ERROR

    local src=""
    for item in ${JOB_SOURCE_DATA_ITEMS[@]}
    do
	if [ $CONNECT_TYPE -eq $CONNECT_TYPE_LAN ];
	then
	    src="${src} \"$(echo "rsync://${RSYNC_LAN_USER}@${DATA_IP}:${RSYNC_LAN_PORT}/snap/${JOB_GUID}${item}" | escape -s)\""
	else
	    src="${src} \"$(echo "rsync://${DATA_IP}:${RSYNC_PORT}/snap/${JOB_GUID}${item}" | escape -s)\""
	fi
    done

    src=${src# }
    [ -n "${src}" ] && {
	log_inf "Copy in progress"

	do_item_backup "${src}"

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

do_rotate()
{
    [ $HCOPY_DONE -eq $NO ] && return $OK
    [ "x${JOB_ROTATE}" == "x0" ] && return $OK

    log_inf "Rotate backups (${JOB_ROTATE})"
    local numm=$(ls "${TARGET_PATH}" | sort | grep -v backup.lock | wc -l)
    [ $numm -gt $JOB_ROTATE ] && {
	let JOB_ROTATE++
	local marker=$(ls "${TARGET_PATH}" | sort | grep -v backup.lock | tail -${JOB_ROTATE} | head -1)
	log_inf "Rotation marker is \"${marker}\""
	find "${TARGET_PATH}/" -maxdepth 1 ! -newer "${TARGET_PATH}/${marker}" -exec rm -r {} \;
    }
    return $OK
}

lock_target()
{
    if [ ! -d "${TARGET_PATH}" ]
    then
	log_inf "Create target folder: ${TARGET_PATH}"
	mkdir -p "${TARGET_PATH}" || {
	    log_err "Target folder \"${TARGET_PATH}\" cannot be created"
	    return $ERROR
	}
	chown $ADMIN_USER:$ADMIN_GROUP "${TARGET_PATH}"
    fi

    log_inf "Locking target folder: ${TARGET_PATH}"
    [ -e "${BACKUP_LOCK}" ] && {
	log_inf "Previous lock detected"
	local pcount=$(ps -p `cat "${BACKUP_LOCK}"` | sed 1d | wc -l)
	if [ ${pcount} -gt 0 ]
	then
	    log_err "Instance of same job in progress"
	    return $ERROR
	else
	    log_inf "Remove stale lock"
	    rm -f "${BACKUP_LOCK}"
	fi
    }
    echo $$ > "${BACKUP_LOCK}"
    return $OK
}

unlock_target()
{
    [ $LOCK_DONE -eq $NO ] && return $OK
    log_inf "Unlock target folder: ${TARGET_PATH}"
    rm -f "${BACKUP_LOCK}" >/dev/null 2>&1
    return $OK
}

remove_temp_dirs()
{
    rm -rf "${BACKUP_PATH_TEMP}" >/dev/null 2>&1
    return $OK
}

create_temp_dirs()
{
    remove_temp_dirs
    mkdir -p "${BACKUP_DATA_TEMP}" >/dev/null 2>&1 || {
	log_err "Unable to create temp folder \"${BACKUP_DATA_TEMP}\""
	return $ERROR
    }
    chown $ADMIN_USER:$ADMIN_GROUP "${BACKUP_DATA_TEMP}"
    return $OK
}

pre_process()
{
    [ -e "${BACKUP_PATH}" ] && {
	log_err "Backup folder already exist \"${BACKUP_PATH}\""
	return $ERROR
    }

    lock_target || {
	log_err "Unable to lock backup folder"
	return $ERROR
    }
    LOCK_DONE=$YES

    create_temp_dirs || {
	log_err "Unable to create temporary folders"
	return $ERROR
    }

    JOB_STATE="ACTIVE"
    log_dbg "Set job state to ACTIVE"
    send_job_state "${JOB_GUID}" "${JOB_STATE}"

    do_hcopy "${RESUME_FOLDER}" || return $ERROR
    HCOPY_DONE=$YES

    p2p_connect "${JOB_NETID}" "${P2P_PEER}" || return $ERROR
    CONN_DONE=$YES

    setup_rsync || return $ERROR

    create_snapshot || return $ERROR
    return $OK
}

post_process()
{
    mv "${BACKUP_DATA_TEMP}" "${BACKUP_DATA_PATH}" >/dev/null 2>&1

    local FINAL_BACKUP_FOLDER="${BACKUP_PATH}"

    case "x${1}" in
	"xcancel")
	    FINAL_JOB_STATUS="CANCELLED"
	    FINAL_BACKUP_FOLDER="${BACKUP_PATH} (cancelled)"
	    ;;
	"xpause")
	    FINAL_JOB_STATUS="PAUSED"
	    FINAL_BACKUP_FOLDER="${BACKUP_PATH} (paused)"
	    ;;
	*)
	    [[ ${RCOPY_DONE} -eq $YES ]] && {
		FINAL_JOB_STATUS="SUCCESS"
		FINAL_BACKUP_FOLDER="${BACKUP_PATH}"
	    } || {
		FINAL_JOB_STATUS="FAILED"
		FINAL_BACKUP_FOLDER="${BACKUP_PATH} (failed)"
	    }
	    ;;
    esac

    if [ $HCOPY_DONE -eq $NO ];
    then
	log_warn "Incremental initial copy was not finished"
	log_warn "Backup folder \"${BACKUP_PATH}\" removed"
	rm -rf "${BACKUP_PATH_TEMP}"
    else
	mv "${BACKUP_PATH_TEMP}" "${FINAL_BACKUP_FOLDER}"  >/dev/null 2>&1
    fi

    do_rotate

    delete_snapshot

    [ $CONN_DONE -eq $YES ] && p2p_disconnect "${JOB_NETID}" "${P2P_PEER}"

    remove_temp_dirs

    [ "x${JOB_STATE}" == "xACTIVE" ] && log_dbg "Set job state to PENDING"

    unlock_target

    log_inf "Job finished"

    $SYS_PREFIX/bin/report.sh "${FINAL_JOB_STATUS}" "${JOB_GUID}" "${LOG_GUID}"

    [ "x${JOB_STATE}" == "xACTIVE" ] && {
	JOB_STATE="PENDING"
	send_job_state "${JOB_GUID}" "${JOB_STATE}"
    }
}

#
# arg: <resume.folder>
#
do_item_hcopy()
{
    RESUME_FOLDER="${1}"
    [ ! -e "${RESUME_FOLDER}" ] && {
        log_warn "Resume folder \"${RESUME_FOLDER}\" not found"
        return $ERROR
    }
    log_inf "Resume folder is \"${RESUME_FOLDER}\""
    cp -alR "${RESUME_FOLDER}/"* "${BACKUP_DATA_TEMP}" >/dev/null 2>&1 || log_warn "Incremental not possible"
    sync
    return $OK
}

#
# arg: [<resume.folder>]
#
do_hcopy()
{
    shopt -s dotglob
    [ -n "${RESUME_FOLDER}" ] && {
	do_item_hcopy "${RESUME_FOLDER}" && return $OK
	return $ERROR
    }

    local last_backup=$(find "${TARGET_PATH}" -maxdepth 1 -mindepth 1 -type d | grep -v '.*(in process)$' | grep '.*/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}-[0-9]\{2\}[^/]*$' | sort | tail -1)
    [ -n "${last_backup}" ] && {
	do_item_hcopy "${last_backup}/data" && return $OK
    }

    log_inf "Making full backup"
    return $OK
}

cancel()
{
    log_err "Job cancelled"
    post_process "cancel"
    exit $ERROR
}

pause()
{
    log_err "Job paused"
    post_process "pause"
    exit $ERROR
}

##########################################################

trap cancel USR1
trap pause  USR2

[ $# -lt 2 ] && exit $ERROR

load_job "${1}" || exit $ERROR
set_vars "${2}" "${3}"

log_attach "${LOG_FOLDER}/${LOG_GUID}.log"

log_inf "Replicate version: $(rxml ${SYS_PREFIX}/etc/version.xml /Version/Current) build $(rxml ${SYS_PREFIX}/etc/version.xml /Version/Build)"
log_inf "Starting backup job \"${JOB_NAME}\""

pre_process && {
    [ "x${JOB_SYS}" == "xtrue" ] && do_conf_backup
    do_backup
}
post_process

exit $OK
