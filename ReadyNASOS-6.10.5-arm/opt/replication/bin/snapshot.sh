#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <task.path>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE:
#echo "${1}" >> "${SYS_PREFIX}/bin/snapshot.log"

#
# arg: <succeed{true|false}> <rsync.path>
#
send_report()
{
    local succeed="${1}"
    REPORT="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    REPORT="${REPORT}<report succeed=\"${succeed}\">"
    REPORT="${REPORT}${REPORT_DATA}"
    REPORT="${REPORT}<messages>${REPORT_MSG}</messages>"
    REPORT="${REPORT}<errors>${REPORT_ERR}</errors>"
    REPORT="${REPORT}</report>"
    local report="${TMP_FOLDER}/$(uuid).report"
    echo "${REPORT}" > "${report}"
    rsync --timeout=90 -aq --iconv=UTF-8 "${report}" "${2}" >/dev/null 2>&1
    rm -f "${report}" >/dev/null 2>&1
    return $OK
}

#
# arg: <job.guid>
#
delete_snapshot()
{
    local guid="${1}"

    for v in ${volumes[@]}
    do
	v="${v#/}"
	local volume="${v%%/*}"
	local subvolume="${v#*/}"
	subvolume="${subvolume%%/*}"

	[ ! -e "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" ] && continue

	umount "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" >/dev/null 2>&1
	nmlctl destroy "${volume}/${subvolume}@${guid}" >/dev/null 2>&1
	rmdir  "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" >/dev/null 2>&1
	rmdir  "${SNAP_PREFIX}/${guid}/${volume}" >/dev/null 2>&1
    done
    rmdir "${SNAP_PREFIX}/${guid}" >/dev/null 2>&1
    return $OK
}

#
# arg: <job.guid>
#
create_snapshot()
{
    local guid="${1}"
    delete_snapshot "${guid}"

    [ "x${size}" == "x0" ] && {
	REPORT_MSG="${REPORT_MSG}<msg>Snapshot is not requested</msg>"
	REPORT_MSG="${REPORT_MSG}<msg>Backup could be inconsistent</msg>"
    }

    for v in ${volumes[@]}
    do
	v="${v#/}"
	local volume="${v%%/*}"
	local subvolume="${v#*/}"
	subvolume="${subvolume%%/*}"

	[ -e "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" ] && continue

	mkdir -p "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" || {
	    REPORT_ERR="${REPORT_ERR}<err>Unable to create backup folder for ${volume}/${subvolume}</err>"
	    return $ERROR
	}

	[ "x${size}" == "x0" ] && {
	    mount -o bind "/${volume}/${subvolume}" "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" || {
		REPORT_ERR="${REPORT_ERR}<err>Unable to mount ${volume}/${subvolume}</err>"
		return $ERROR
	    }
	    continue
	}

	# create snapshot
	nmlctl create "${volume}/${subvolume}@${guid}" || {
	    REPORT_ERR="${REPORT_ERR}<err>Unable to take snapshot for ${volume}/${subvolume}</err>"
	    return $ERROR
	}

	# lookup snapshot
	sn_loc=""
	for dir in `ls -r "${volume}/${subvolume}/.snapshots"`
	do
	    sn=$(rxml "/${volume}/${subvolume}/.snapshots/${dir}/info.xml" "/snapshot/userdata/value")
	    [ "xr_${guid}" == "x${sn}" ] && {
		sn_loc="/${volume}/${subvolume}/.snapshots/${dir}/snapshot"
    		break
	    }
	done
	[ -z  "${sn_loc}" ] && {
	    REPORT_ERR="${REPORT_ERR}<err>Unable to locate snapshot for ${volume}/${subvolume}</err>"
	    return $ERROR
	}

	# mount snapshot
	mount -o bind "${sn_loc}" "${SNAP_PREFIX}/${guid}/${volume}/${subvolume}" || {
	    REPORT_ERR="${REPORT_ERR}<err>Unable to mount snapshot for ${volume}/${subvolume}</err>"
	    return $ERROR
	}
    done
    return $OK
}

#
# arg:
#
get_volumes()
{
    REPORT_DATA="<volumes>"
    local volumes=($(nmlctl list -t volume))
    for v in ${volumes[@]}
    do
	REPORT_DATA="${REPORT_DATA}<item>${v}</item>"
    done
    REPORT_DATA="${REPORT_DATA}</volumes>"
    return $OK
}

#############################################

# analize arguments
[ $# != 1 ] && {
    exit $ERROR
}

task="${1}"
guid=$(rxml ${task} /task/guid)
size=$(rxml ${task} /task/size)
action=$(rxml ${task} /task/action)
report=$(rxml ${task} /task/report)
volumes=$(rxml ${task} /task/items/item)
error_file="$TMP_FOLDER/${guid}.err"
rm -f "${task}" >/dev/null 2>&1

case "${action}" in
    "create")
	rm -f "${error_file}"
	create_snapshot "${guid}" && {
	    send_report "true" "${report}"
	    exit $OK
	}
	delete_snapshot "${guid}"
	send_report "false" "${report}"
	exit $ERROR
	;;
    "delete")
	delete_snapshot "${guid}" && {
	    send_report "true" "${report}"
	    rm -f "${error_file}"
	    exit $OK
	}
	send_report "false" "${report}"
	rm -f "${error_file}"
	exit $ERROR
	;;
    "getvolumes")
	get_volumes && {
	    send_report "true" "${report}"
	    exit $OK
	}
	send_report "false" "${report}"
	exit $ERROR
	;;
    *)
	exit $ERROR
	;;
esac

exit $OK
