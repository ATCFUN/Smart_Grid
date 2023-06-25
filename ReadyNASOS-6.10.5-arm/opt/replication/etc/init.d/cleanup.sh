#!/bin/bash

# load environment
. /opt/replication/bin/env.sh

SCRIPTNAME=$0

do_start()
{
    rm -f "${TSK_FOLDER}"/tmp/* >/dev/null 2>&1
    rm -f "${TSK_FOLDER}"/* >/dev/null 2>&1
    rm -f "${JOB_FOLDER}"/* >/dev/null 2>&1
    rm -f "${LOG_FOLDER}"/* >/dev/null 2>&1
    return $OK
}

case "$1" in
    start)
	echo -n "Starting startup cleanup..."
	do_start || {
	    echo "failed"
	    exit $ERROR
	}
	echo "done"
	;;
    *)
	echo "Usage: ${SCRIPTNAME} {start}" >&2
	exit $ERROR
	;;
esac

exit $OK
