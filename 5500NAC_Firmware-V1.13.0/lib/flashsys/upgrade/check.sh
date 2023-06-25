#!/bin/sh
. /lib/upgrade/common.sh
platform_check_image "$1" >/dev/null 2>&1 && echo 1 || echo 0
