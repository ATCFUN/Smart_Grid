#!/bin/bash

. /opt/replication/bin/env.sh

SCRIPTNAME=$0

do_start()
{
    nohup ${SYS_PREFIX}/etc/init.d/rsyncd.p2p.sh start >/dev/null 2>&1 &
    ${SYS_PREFIX}/etc/init.d/rsyncd.lan.sh start
    return $OK
}

do_stop()
{
    ${SYS_PREFIX}/etc/init.d/rsyncd.lan.sh stop
    ${SYS_PREFIX}/etc/init.d/rsyncd.p2p.sh stop
    return $OK
}

case "$1" in
    start)
	do_start
	;;
    stop)
	do_stop
	;;
    restart)
	do_stop
	do_start 
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start|stop|restart}" >&2
	exit $ERROR
	;;
esac

exit $OK
