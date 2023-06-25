#!/bin/sh
. /lib/upgrade/common.sh
platform_check_image "$1" >&- 2>&- && echo 1 || echo 0
