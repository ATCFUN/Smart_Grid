#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

# get Url for hook server
FETCH_URL=$(rxml ${REPLICATION_CONFIG} /replication/fetch_url)

# check if we need proxy
USE_PROXY=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/UseProxy)

# auth data
NAS_NAME=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Username)
NAS_PASS=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Password)

# construct comm exec
COMM_EXEC="curl --basic -k --user ${NAS_NAME}:${NAS_PASS} --url ${FETCH_URL}"
[ "x${USE_PROXY}" == "xTrue" ] && {
    PROXY_HOST=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/@Address)
    PROXY_PORT=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/@Port)
    COMM_EXEC="${COMM_EXEC} --proxy-anyauth --proxy ${PROXY_HOST}:${PROXY_PORT}"
    PROXY_NEED_AUTH=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/Authtentication/@Value)
    [ "x${PROXY_NEED_AUTH}" == "xTrue"  ] && {
        PROXY_USERNAME=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/Username)
        PROXY_PASSWORD=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/Password)
        COMM_EXEC="${COMM_EXEC} --proxy-user ${PROXY_USERNAME}:${PROXY_PASSWORD}"
    }
}

#
# args: <file.path> [<store.path>]
#
comm_post_file()
{
    COMM_RESULT=""
    [ -z "${1}" ] && return $ERROR
    if [ -z "${2}" ];
    then
	FULL_EXEC="\`cat "${1}" | ${COMM_EXEC} -X POST --data-binary @- 2>/dev/null\`"
    else
	FULL_EXEC="\`cat "${1}" | ${COMM_EXEC} -X POST --data-binary @- 2>/dev/null > "${2}"\`"
    fi
    eval COMM_RESULT="${FULL_EXEC}" || return $ERROR
    return $OK
}

#
# arg: <data> [<store.path>]
#
comm_post_data()
{
    local post="${COMM_TMP_FOLDER}/$(uuid).post"
    echo "${1}" > "${post}"
    comm_post_file "${post}" "${2}" || {
	rm -f "${post}"
	return $ERROR
    }
    rm -f "${post}"
    return $OK
}

#
# args: <job.guid> <store.path>
#
fetch_job()
{
    local guid="${1}"
    local path="${2}"
    local DATA="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    DATA="${DATA}<request moniker=\"/root/devices\" method=\"jobfetch\">"
    DATA="${DATA}<body type=\"text\">"
    DATA="${DATA}<value>${guid}</value>"
    DATA="${DATA}</body></request>"
    comm_post_data "${DATA}" "${path}" || {
	sleep 2
	comm_post_data "${DATA}" "${path}" || return $ERROR
    }
    return $OK
}

#
# args: <job.guid> <job.state>
#
send_job_state()
{
    local guid="${1}"
    local state="${2}"
    local DATA="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    DATA="$DATA<request moniker=\"/root/devices\" method=\"jobstate\">"
    DATA="$DATA<body type=\"jobstate\">"
    DATA="$DATA<guid>${guid}</guid>"
    DATA="$DATA<state>${state}</state>"
    DATA="$DATA</body></request>"
    comm_post_data "${DATA}" || {
	sleep 2
	comm_post_data "${DATA}" || return $ERROR
    }
    return $OK
}
