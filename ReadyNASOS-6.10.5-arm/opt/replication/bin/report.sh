#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------
# arg: <status{SUCCEED|FAILED|CANCELLED|PAUSED}> <job.guid> <log.guid>
#-------------------------------------------------------------------------

# load environment
. /opt/replication/bin/env.sh

# TODELETE:
#echo "${1} ${2} ${3}" >> "${SYS_PREFIX}/bin/report.log"

[ $# != 3 ] && exit $ERROR

# read args
STATUS="${1}"
JOB_GUID="${2}"
LOG_GUID="${3}"

LOG_LOG="${LOG_FOLDER}/${LOG_GUID}.log"
LOG_FILES="${LOG_FOLDER}/${LOG_GUID}.files"
LOG_EFILES="${LOG_FOLDER}/${LOG_GUID}.efiles"
LOG_SUMM="${LOG_FOLDER}/${LOG_GUID}.summ"
LOG_REPORT="${LOG_FOLDER}/${LOG_GUID}.report"

report_cleanup()
{
    rm -f "${LOG_LOG}"
    rm -f "${LOG_FILES}"
    rm -f "${LOG_EFILES}"
    rm -f "${LOG_SUMM}"
    rm -f "${LOG_REPORT}"
    rm -f "${LOG_FOLDER}/${JOB_GUID}.stat"
}

case "${STATUS}" in
    "SUCCESS")
	SUCCEED="true"
	;;
    *)
	SUCCEED="false"
	;;
esac

# construct report data
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "${LOG_REPORT}"
echo "<request moniker=\"/root/devices\" method=\"sendreport\">" >> "${LOG_REPORT}"
echo "<body type=\"report\">" >> "${LOG_REPORT}"
echo "<guid>${JOB_GUID}</guid>" >> "${LOG_REPORT}"
echo "<reportdate>$(date +"%s000")</reportdate>" >> "${LOG_REPORT}"
echo "<succeed>${SUCCEED}</succeed>" >> "${LOG_REPORT}"
echo "<status>${STATUS}</status>" >> "${LOG_REPORT}"
[ -s "${LOG_LOG}" ] && {
    echo "<log><![CDATA[" >> "${LOG_REPORT}"
    cat "${LOG_LOG}" >> "${LOG_REPORT}"
    echo "]]></log>" >> "${LOG_REPORT}"
}
[ -s "${LOG_FILES}" ] && {
    echo "<files><![CDATA[" >> "${LOG_REPORT}"
    cat ${LOG_FILES} >> "${LOG_REPORT}"
    echo "]]></files>" >> "${LOG_REPORT}"
}
[ -s "${LOG_EFILES}" ] && {
    echo "<efiles><![CDATA[" >> "${LOG_REPORT}"
    cat ${LOG_EFILES} >> "${LOG_REPORT}"
    echo "]]></efiles>" >> "${LOG_REPORT}"
}
[ -s "${LOG_SUMM}" ] && {
    echo "<summ><![CDATA[" >> "${LOG_REPORT}"
    cat ${LOG_SUMM} >> "${LOG_REPORT}"
    echo "]]></summ>" >> "${LOG_REPORT}"
}
echo "</body></request>" >> "${LOG_REPORT}"

comm_post_file "${LOG_REPORT}" || {
    report_spool_put "${JOB_GUID}" "${LOG_REPORT}"
    report_cleanup
    exit $ERROR
}
report_cleanup
exit $OK
