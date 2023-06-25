#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <task.path>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/info.log"

#/opt/replication/etc/init.d/rsyncd.lan.sh start

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

get_rsync_credentials()
{
    [ ! -e "${RSYNC_LAN_SECRET}" ] && return $ERROR
    local secret_pair=$(cat "${RSYNC_LAN_SECRET}" | tr -d '\n')
    local secret_user="${secret_pair%:*}"
    local secret_pass="${secret_pair#*:}"
    REPORT_DATA="<rsync_credentials><user>${secret_user}</user><pass>${secret_pass}</pass></rsync_credentials>"
    return $OK
}

###############################

[ $# != 1 ] && exit $ERROR

task="${1}"
action=$(rxml ${task} /task/action)
report=$(rxml ${task} /task/report)
guid=$(rxml ${task} /task/guid)
rm -f "${task}" >/dev/null 2>&1

case "${action}" in
    "get_rsync_credentials")
	succeed="false"
	get_rsync_credentials && succeed="true"
	send_report "${succeed}" "${report}"
	;;
    *)
	exit $ERROR
	;;
esac

exit $OK
