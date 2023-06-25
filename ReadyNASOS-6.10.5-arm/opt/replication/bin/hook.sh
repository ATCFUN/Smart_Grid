#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: -
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

while true;
do

[ ! -e "${SYS_PREFIX}/etc/registration.conf" ] && {
    sleep 10
    continue
}

# get Url for hook server
HOOK_URL=$(rxml ${REPLICATION_CONFIG} /replication/hook_url)

# check if we need proxy
USE_PROXY=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/UseProxy)

# auth data
NAS_NAME=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Username)
NAS_PASS=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Password)

# construct exec
EXEC="$(which curl) -N --tcp-nodelay --basic --user ${NAS_NAME}:${NAS_PASS} --keepalive-time 30 --connect-timeout 60 --max-time 360000 -k --url ${HOOK_URL}"
[ "x${USE_PROXY}" == "xTrue" ] && {
    PROXY_HOST=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/@Address)
    PROXY_PORT=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/@Port)
    EXEC="${EXEC} --proxy-anyauth --proxy ${PROXY_HOST}:${PROXY_PORT}"
    PROXY_NEED_AUTH=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/Authtentication/@Value)
    [ "x${PROXY_NEED_AUTH}" == "xTrue"  ] && {
	PROXY_USERNAME=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/Username)
	PROXY_PASSWORD=$(rxml ${REMOTE_CONFIG} /Configuration/ConnectionSettings/ProxyType/Password)
	EXEC="${EXEC} --proxy-user ${PROXY_USERNAME}:${PROXY_PASSWORD}"
    }
}

# skip errors
EXEC="${EXEC} 2>/dev/null"

# execute
eval "${EXEC}"

sleep 5

done;
