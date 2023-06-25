#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE:
#echo $(date) >> "${SYS_PREFIX}/bin/spoolp.log"

#
#arg:
#
report_spool_process()
{
    spool=($(find "${SPOOL_FOLDER}" -type f))
    for report in ${spool[@]}
    do
	retries=${report##*:}
	[[ -n "${retries}" && "${retries}" != "${report}" ]] && {
	    let retries++
	    if comm_post_file "${report}" || [ $retries -gt $SPOOL_RETRIES ];
	    then
		rm -f "${report}"
	    else
		mv "${report}" "${report%:*}:${retries}"
	    fi
	}
    done
}

report_spool_process
