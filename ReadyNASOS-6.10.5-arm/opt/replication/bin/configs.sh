#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <task.path>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODOLETE
#echo "$1" >> "${SYS_PREFIX}/bin/configs.log"

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
# arg: <rsync.path>
#
do_backup()
{
    REPORT_MSG="${REPORT_MSG}<msg>Config backup is not supported for ReadyNAS OS</msg>"
    return $OK
}

#
# arg: <rsync.path>
#
do_restore()
{
    REPORT_MSG="${REPORT_MSG}<msg>Config restore is not supported for ReadyNAS OS</msg>"
    return $OK
}

###############################

[ $# != 1 ] && exit $ERROR

task="${1}"
action=$(rxml ${task} /task/action)
guid=$(rxml ${task} /task/guid)
config=$(rxml ${task} /task/config)
report=$(rxml ${task} /task/report)
rm -f "${task}" >/dev/null 2>&1

case "${action}" in
    backup)
	do_backup "${config}" && {
	    send_report "true" "${report}"
	    exit $OK
	}
	send_report "false" "${report}"
	exit $ERROR
	;;
    restore)
	do_restore "${config}" && {
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
