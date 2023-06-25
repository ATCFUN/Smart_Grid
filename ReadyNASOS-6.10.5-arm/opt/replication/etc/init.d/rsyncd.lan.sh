#!/bin/bash

. /opt/replication/bin/env.sh

SCRIPTNAME=$0

#
# arg: <auth.user>
#
write_config()
{
    echo "charset = UTF-8" > "${RSYNC_LAN_CONF}"
    echo "pid file = /opt/replication/var/run/rsyncd.pid.lan" >> "${RSYNC_LAN_CONF}"
    echo "auth users = ${1}" >> "${RSYNC_LAN_CONF}" >> "${RSYNC_LAN_CONF}"
    echo "secrets file = ${RSYNC_LAN_SECRET}" >> "${RSYNC_LAN_CONF}"
    echo "[snap]" >> "${RSYNC_LAN_CONF}"
    echo "comment = \"Replication source\"" >> "${RSYNC_LAN_CONF}"
    echo "path = /var/replicate/snap" >> "${RSYNC_LAN_CONF}"
    echo "read only = yes" >> "${RSYNC_LAN_CONF}"
    echo "uid = root" >> "${RSYNC_LAN_CONF}"
    echo "gid = root" >> "${RSYNC_LAN_CONF}"
    echo "[restore]" >> "${RSYNC_LAN_CONF}"
    echo "comment = \"Replication source\"" >> "${RSYNC_LAN_CONF}"
    echo "path = /" >> "${RSYNC_LAN_CONF}"
    echo "read only = no" >> "${RSYNC_LAN_CONF}"
    echo "uid = root" >> "${RSYNC_LAN_CONF}"
    echo "gid = root" >> "${RSYNC_LAN_CONF}"
}

#
# arg <user> <pass>
#
write_credentials()
{
    echo -n "Credentials generated..."
    echo "${1}:${2}" > "${RSYNC_LAN_SECRET}"
    chmod 600 "${RSYNC_LAN_SECRET}"
}

check_config()
{
    [[ -e "${RSYNC_LAN_SECRET}" && -e "${RSYNC_LAN_CONF}" ]] && return $OK

    local user=$(uuid)
    local pass=$(uuid)

    write_credentials "${user}" "${pass}"
    write_config "${user}"
}

is_started()
{
    [ -e "${RSYNC_LAN_PID}" ] && {
	local pid=$(cat "${RSYNC_LAN_PID}")
	[ -e "/proc/${pid}" ] && {
	    local cmd=$(readlink "/proc/${pid}/exe")
	    [ "x${cmd}" == "x${SYS_PREFIX}/usr/bin/rsync" ] && return $YES
	}
	rm -f "${RSYNC_LAN_PID}"
    }
    return $NO
}

terminate()
{
    [ -e "${RSYNC_LAN_PID}" ] && {
	local pid=$(cat "${RSYNC_LAN_PID}")
	[ -e "/proc/${pid}" ] && {
	    local cmd=$(readlink "/proc/${pid}/exe")
	    [ "x${cmd}" == "x${SYS_PREFIX}/usr/bin/rsync" ] && kill ${pid}
	}
	rm -f "${RSYNC_LAN_PID}"
    }
}

do_start()
{
    echo -n "Start lan rsync daemon..."
    check_config
    ${RSYNC} --daemon --port=${RSYNC_LAN_PORT} --config ${RSYNC_LAN_CONF} --log-file=/dev/null || {
	echo "failed"
	return $ERROR
    }
    echo "done"
    return $OK
}

do_stop()
{
    echo -n "Stop lan rsync daemon..."
    terminate
    echo "done"
    return $OK
}

case "$1" in
    start)
	is_started || do_start || exit $ERROR
	;;
    stop)
	do_stop  || exit $ERROR
	;;
    restart)
	do_stop  || exit $ERROR
	do_start || exit $ERROR
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start|stop|restart}" >&2
	exit $ERROR
	;;
esac

exit $OK
