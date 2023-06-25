#!/bin/bash

# Run this script in background when starting because it waits for p2p to start

. /opt/replication/bin/env.sh

SCRIPTNAME=$0

WAIT_PID="${SYS_PREFIX}/var/run/wait.pid"

is_waiting()
{
    [ -e "${WAIT_PID}" ] && {
	local pid=$(cat "${WAIT_PID}")
	[ -e "/proc/${pid}" ] && {
	    local cmd=$(cat "/proc/${pid}/comm")
	    [ "x${cmd}" == "xrsyncd.p2p.sh" ] && {
		echo waiting!
		return $YES
	    }
	}
	rm -f "${WAIT_PID}"
    }
    return $NO
}

is_started()
{
    [ -e "${RSYNC_PID}" ] && {
	local pid=$(cat "${RSYNC_PID}")
	[ -e "/proc/${pid}" ] && {
	    local cmd=$(readlink "/proc/${pid}/exe")
	    [ "x${cmd}" == "x${SYS_PREFIX}/usr/bin/rsync" ] && return $YES
	}
	rm -f "${RSYNC_PID}"
    }
    return $NO
}

terminate()
{
    [ -e "${RSYNC_PID}" ] && {
	local pid=$(cat "${RSYNC_PID}")
	[ -e "/proc/${pid}" ] && {
	    local cmd=$(readlink "/proc/${pid}/exe")
	    [ "x${cmd}" == "x${SYS_PREFIX}/usr/bin/rsync" ] && kill ${pid}
	}
	rm -f "${RSYNC_PID}"
    }
}

do_start()
{
    is_started && return $OK
    is_waiting && return $OK
    echo $$ > "${WAIT_PID}"
    while true
    do
	p2p_set_local_ip
	[ "x${LOCAL_IP}" != "x" ] && break
	sleep 5
    done
    ${RSYNC} --daemon --port=${RSYNC_PORT} --address=${LOCAL_IP} --config ${RSYNC_CONF} --log-file=/dev/null || return $ERROR
    rm -f "${WAIT_PID}"
    return $OK
}

do_stop()
{
    #TODO redo
    pids=`ps ax | grep "${SYS_PREFIX}/etc/init.d/rsyncd.p2p.sh start" | grep -v grep | awk {'print $1'}`
    [ "x${pids}" != "x" ] && echo "${pids}" | xargs kill
    terminate
    return $OK
}

case "$1" in
    start)
	echo -n "Start p2p rsync daemon..."
	do_start || {
	    echo "failed"
	    exit $ERROR
	}
	echo "done"
	;;
    stop)
	echo -n "Stop p2p rsync daemon..."
	do_stop
	echo "done"
	;;
    restart)
	echo -n "Restart p2p rsync daemon..."
	do_stop
	do_start || {
	    echo "failed"
	    exit $ERROR
	}
	echo "done"
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start|stop|restart}" >&2
	exit $ERROR
	;;
esac

exit $OK
