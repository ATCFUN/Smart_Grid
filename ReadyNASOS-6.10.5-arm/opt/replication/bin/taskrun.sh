#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <task.path>
#-------------------------------------------------------------------------

# analize arguments
[ $# != 1 ] && exit $ERROR

# load environment
. /opt/replication/bin/env.sh

# TODELETE:
#echo "${1}" >> "${SYS_PREFIX}/bin/taskrun.log"

#
# arg: <task.path>
#
do_run()
{
    local task="${1}"
    local type=$(rxml "${task}" /task/@type)
    local handler="${type}.sh"
    nohup ${SYS_PREFIX}/bin/${handler} "${task}" >/dev/null 2>&1 &
    return $OK
}

# execute task
do_run "${1}"

exit $OK
