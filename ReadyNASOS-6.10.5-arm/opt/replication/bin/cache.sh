#!/bin/bash
#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

#
# args: <file.path> <key>
#
file_cache_put()
{
    cp "${1}" "${CACHE_FOLDER}/${2}" && return $OK
    return $ERROR
}

#
# args: <key> <file.path>
#
file_cache_get()
{
    cp "${CACHE_FOLDER}/${1}" "${2}" && return $OK
    return $ERROR
}

#
# args: <key>
#
file_cache_remove()
{
    rm -f "${CACHE_FOLDER}/${1}" && return $OK
    return $ERROR
}
