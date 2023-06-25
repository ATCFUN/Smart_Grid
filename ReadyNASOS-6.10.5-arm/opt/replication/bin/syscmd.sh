#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arguments: "<action>[:<msg.guid>]"
#-------------------------------------------------------------------------

# check args number
[ $# != 1 ] && exit $ERROR

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/syscmd.log"

# parse arguments
MSG_GUID=$(echo "${1}" | tr -d '\015')

#
# arg: <volume{c|d|e|f}>
#
get_snapshot_info()
{
    local volume=$1

    [[ -z "${volume}" || ! -e "/${volume}" ]] && return $ERROR

    IFS=$IFS_COLON
    vg=($(vgdisplay -c "${volume}" 2>/dev/null))
    local pe_size=${vg[12]}
    let pe_size=$(( $pe_size / 1024 ))
    local pe_free=${vg[15]}

    local available=$(( $pe_free * $pe_size ))
    local reserved=${available}

    IFS=$IFS_NEWLINE
    local snapshots=$(lvdisplay -c "${volume}" 2>/dev/null | tail -n +2)
    local counter=0
    for snapshot in ${snapshots[@]}
    do
	IFS=$IFS_COLON
	lv=(${snapshot})
	let reserved+=$(( ${lv[7]} * $pe_size ))
	let counter+=1
	IFS=$IFS_NEWLINE
    done
    SNAPSHOTS="<snapshots><space_reserved>${reserved}</space_reserved><space_available>${available}</space_available><snapshots_number>${counter}</snapshots_number></snapshots>"
    return $OK
}

#
# arg: <msg.guid>
#
do_getinfo()
{
    local guid="${1}"
    DATA="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    DATA="${DATA}<request moniker=\"/root/devices\" method=\"sendinfo\">"
    DATA="${DATA}<body type=\"deviceinfo\">"
    DATA="${DATA}<guid>${guid}</guid><value><![CDATA["
    DATA="${DATA}<deviceinfo>"
    # add replicate version
    DATA="${DATA}<replicate>$(tail -n 4 ${SYS_PREFIX}/etc/version.xml)</replicate>"
    # add hostname
    DATA="${DATA}<hostname>$(hostname)</hostname>"
    # add identity
    nmlctl info > /tmp/sysinfo.xml && {
	DATA="${DATA}<identity>"
	DATA="${DATA}<arch>x86</arch>"
	DATA="${DATA}<model>$(rxml /tmp/sysinfo.xml /SystemInfo/Model)</model>"
	DATA="${DATA}<osname>$(rxml /tmp/sysinfo.xml /SystemInfo/Firmware_Name)</osname>"
	DATA="${DATA}<osver>$(rxml /tmp/sysinfo.xml /SystemInfo/Firmware_Version)</osver>"
	DATA="${DATA}</identity>"
    }
    # add memory info
    DATA="${DATA}<mem><size>$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')</size><free>$(cat /proc/meminfo | grep MemFree | awk '{print $2}')</free></mem>"
    # add time info
    DATA="${DATA}<date>$(date +"%s000")</date>"
    DATA="${DATA}<tz>$(date +%Z)</tz>"
    DATA="${DATA}<tz_numeric>$(date +%:z)</tz_numeric>"
    DATA="${DATA}<tz_abbreviation>$(date +%Z)</tz_abbreviation>"
    DATA="${DATA}<uptime>$(temp=$(cat /proc/uptime) && echo ${temp%%.*})</uptime>"
    # add volumes info
    DATA="${DATA}<volumes>"
    local volumes=($(nmlctl list -t volume))
    for v in ${volumes[@]}
    do
	DATA="${DATA}<volume mount=\"/${v}\">"
	DATA="${DATA}<size>$(df "/${v}" | tail -1 | awk '{print $2}')</size>"
	DATA="${DATA}<free>$(df "/${v}" | tail -1 | awk '{print $4}')</free>"
	DATA="${DATA}<snapshots>"
	DATA="${DATA}<space_reserved>1</space_reserved>"
	DATA="${DATA}<space_available>1</space_available>"
	DATA="${DATA}<snapshots_number>0</snapshots_number>"
	DATA="${DATA}</snapshots>"
	DATA="${DATA}</volume>"
    done
    DATA="${DATA}</volumes>"
    DATA="${DATA}</deviceinfo>"
    DATA="${DATA}]]></value></body></request>"
    comm_post_data "${DATA}" || return $ERROR
    return $OK
}

#
# arg: -
#
do_unregister()
{
    :> "${SYS_PREFIX}/etc/cron.d/replication"
    rm -f "${SYS_PREFIX}/etc/registration.conf"
    killall -9 /opt/replication/usr/bin/curl  >/dev/null 2>&1
    return $OK
}

#########################################

[ $# != 1 ] && exit $ERROR

chop=$(echo "${1}" | tr -d '\015')
OIFS=${IFS}
IFS=":"
arg=(${chop})
action="${arg[0]}"
arg0="${arg[1]}"
IFS=${OIFS}

# execute action
case "${action}" in
    "getinfo")
	do_getinfo "${arg0}"
	;;
    "unregister")
	do_unregister
	;;
    *)
	exit $ERROR
	;;
esac
exit $OK
