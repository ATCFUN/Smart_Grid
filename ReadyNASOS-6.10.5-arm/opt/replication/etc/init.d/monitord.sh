#!/bin/bash

. /opt/replication/bin/env.sh

SCRIPTNAME=$0

do_start()
{
    ${SYS_PREFIX}/bin/monitord
    return $ERROR
}

do_stop()
{
    killall -9 monitord 2>/dev/null
    killall -9 inotifywait 2>/dev/null
    rm -f /var/run/monitord.pid
    return $OK
}

case "$1" in
    start)
	echo -n "Start monitor daemon..."
	do_stop
	do_start
	echo "done"
	;;
    stop)
	echo -n "Stop monitor daemon..."
	do_stop
	echo "done"
	;;
    restart)
	echo -n "Restart monitor daemon..."
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
