#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

LOG="/dev/null"
DBG=$NO
PRINT=$NO
[ -e "${SYS_PREFIX}/etc/DEBUG" ] && {
    DBG=$YES
    PRINT=$YES
}

#
# arg: <file.name>
#
log_init()
{
    LOG="$1"
    :> "${LOG}"
    return $OK
}

#
# arg: <file.name>
#
log_attach()
{
    LOG="$1"
    return $OK
}

#
# arg: <log.line>
#
log_inf()
{
    log "[Info] $1" || return $ERROR
    return $OK
}

#
# arg: <log.line>
#
log_warn()
{
    log "[Warning] $1" || return $ERROR
    return $OK
}

#
# arg: <log.line>
#
log_err()
{
    [ ${RCOPY_DONE} -eq $OK ] && {
	log_warn "${1}"
	return $OK
    }

    log "[Error] $1" || return $ERROR
    return $OK
}

#
# arg: <log.line>
#
log_dbg()
{
    [ ${DBG} -eq $YES ] && {
	log "[Debug] $1" || return $ERROR
    }
    return $OK
}

#
# arg: <log.line>
#
log()
{
    local line="[$(date +"%Y-%m-%d %H:%M:%S")] $1"
    echo ${line} >> ${LOG}
    [ ${PRINT} -eq $YES ] && echo ${line}
    return $OK
}
