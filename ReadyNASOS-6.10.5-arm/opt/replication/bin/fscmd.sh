#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <action{grab|mkdir}>:<msg.guid>:<file.path>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE
#echo "${1}" >> "${SYS_PREFIX}/bin/fscmd.log"

#
# arg: <msg.guid> <path>
#
do_grab()
{
    local guid="${1}"
    local path="${2}"
    local FS=$(fsgrab 1 ${path})
    local DATA="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    DATA="${DATA}<request moniker=\"/root/devices\" method=\"sendfsgrab\">"
    DATA="${DATA}<body type=\"fsgrab\">"
    DATA="${DATA}<guid>${guid}</guid>"
    DATA="${DATA}<value><![CDATA[${FS}]]></value>"
    DATA="${DATA}</body></request>"
    comm_post_data "${DATA}" || return $ERROR
    return $OK
}

#
# arg: <file.path>
#
do_mkdir()
{
    local src=$(echo "${1}" | sed -e 's/\/*$//')
    local volume=${src#/}
    volume=${volume%%/*}

    local volumes=($(nmlctl list -t volume))
    for v in ${volumes[@]}
    do
	[ "x${v}" == "x${volume}" ] && {
	    mkdir -p "${src}" || return $ERROR
	    chown $ADMIN_USER:$ADMIN_GROUP "${src}"
	    return $OK
	}
    done
    return $ERROR
}

#
# arg: <file.path>
#
do_rm()
{
    local src=$(echo "${1}" | sed -e 's/\/*$//')
    local volume=${src#/}
    volume=${volume%%/*}

    local volumes=($(nmlctl list -t volume))
    for v in ${volumes[@]}
    do
	[ "x${v}" == "x${volume}" ] && {
	    [ -d "${src}" ] && {
		rm -rf "${src}" && return $OK
		return $E_FAIL
	    }
	    [ -e "${src}" ] && {
		rm -f "${src}" && return $OK
		return $E_FAIL
	    }
	    return $ERROR
	}
    done
    return $ERROR
}

#######################################

[ $# != 1 ] && {
    exit $ERROR
}

chop=$(echo "${1}" | tr -d '\015')
IFS=$IFS_COLON
arg=(${chop})
action="${arg[0]}"
guid="${arg[1]}"
IFS=$IFS_NEWLINE
path="${chop#${action}:${guid}:}"

# execute action
case "${action}" in
    "grab")
	do_grab "${guid}" "${path}"
	;;
    "mkdir")
        do_mkdir "${path}"
        ;;
    "rm")
	do_rm "${path}"
        ;;
    *)
	exit $ERROR
	;;
esac

exit $OK
