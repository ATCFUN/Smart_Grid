#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

#
#arg: <job.guid> <report.path>
#
report_spool_put()
{
    cp "${2}" "${SPOOL_FOLDER}/${1}:$(uuid):0" && return $OK
    return $ERROR
}

#
#arg: [<job.guid>]
#
report_spool_remove()
{
    local job_guid="${1}"
    if [ -n "${job_guid}" ];
    then
	rm -f "${SPOOL_FOLDER}"/${job_guid}*
    else
	rm -f "${SPOOL_FOLDER}"/*
    fi
}
