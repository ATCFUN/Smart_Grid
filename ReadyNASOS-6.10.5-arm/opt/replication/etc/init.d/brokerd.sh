#!/bin/bash

. /opt/replication/bin/env.sh

SCRIPTNAME=$0

do_start()
{
    ${SYS_PREFIX}/bin/brokerd
    return $OK
}

do_stop()
{
    killall -9 brokerd >/dev/null 2>&1
    killall -9 hook.sh >/dev/null 2>&1
    killall -9 curl >/dev/null 2>&1
    rm -f /var/run/brokerd.pid
    return $OK
}

case "$1" in
    start)
	echo -n "Start broker daemon..."
	do_stop
	do_start
	echo "done"
	;;
    stop)
	echo -n "Stop broker daemon..."
	do_stop
	echo "done"
	;;
    restart)
	echo -n "Restart broker daemon..."
	do_stop
	do_start
	echo "done"
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start|stop|restart}" >&2
	exit $ERROR
	;;
esac

exit $OK
