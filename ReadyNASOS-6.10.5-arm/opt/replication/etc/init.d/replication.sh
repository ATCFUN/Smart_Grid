#!/bin/bash

# load environment
. /opt/replication/bin/env.sh

ADDON_LOCK="/var/run/replicate.lock"

SCRIPTNAME=$0

create_shm()
{
    mkdir -p "${SHM_FOLDER}" >/dev/null 2>&1
    if grep -qs "${SHM_FOLDER}" /proc/mounts;
    then
	rm -rf "${SHM_FOLDER}"/* >/dev/null 2>&1
    else
	mount -t tmpfs -o size=${SHM_SIZE} tmpfs "${SHM_FOLDER}" >/dev/null 2>&1
    fi
    mkdir -p "${TMP_FOLDER}"
    mkdir -p "${LOG_FOLDER}"
    mkdir -p "${JOB_FOLDER}"
    mkdir -p "${TSK_FOLDER}"
    mkdir -p "${TSK_FOLDER}/tmp"
    #for <=1.0.2 compatibility
    mkdir -p "${TSK_FOLDER}/temp"

    chown -R admin:admin "${SHM_FOLDER}"
}

remove_shm()
{
    if grep -qs "${SHM_FOLDER}" /proc/mounts;
    then
	rm -rf "${SHM_FOLDER}"/* >/dev/null 2>&1
	umount -f "${SHM_FOLDER}" >/dev/null 2>&1
    fi
}

do_start()
{
    ln -s "${SYS_PREFIX}/etc/cron.d/replication" /etc/cron.d/replication
    ln -s "${SYS_PREFIX}/etc/cron.d/spool" /etc/cron.d/spool

    create_shm

    ${SYS_PREFIX}/etc/init.d/cleanup.sh start
    ${SYS_PREFIX}/etc/init.d/brokerd.sh start
    ${SYS_PREFIX}/etc/init.d/monitord.sh start
    ${SYS_PREFIX}/etc/init.d/rsyncd.sh start

    ln -s "${SYS_PREFIX}/etc/cron.d/watchdog" /etc/cron.d/watchdog

    touch "${ADDON_LOCK}"

    return $OK
}

do_stop()
{
    rm -f /etc/cron.d/replication
    rm -f /etc/cron.d/watchdog
    rm -f /etc/cron.d/spool

    ${SYS_PREFIX}/etc/init.d/brokerd.sh stop
    ${SYS_PREFIX}/etc/init.d/monitord.sh stop
    ${SYS_PREFIX}/etc/init.d/rsyncd.sh stop

    remove_shm

    rm -f "${ADDON_LOCK}"
    return $OK
}

case "$1" in
    start)
	echo "Start replication..."
	do_stop
	do_start
	echo "done"
	;;
    stop)
	echo "Stop replication..."
	do_stop
	echo "done"
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start|stop}" >&2
	exit $ERROR
	;;
esac

exit $OK
