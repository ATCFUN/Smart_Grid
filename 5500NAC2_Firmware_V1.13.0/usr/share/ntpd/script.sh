#!/bin/sh

#
# Run by ntpd when the clock is stepped (step), stratum  is changed (stratum) and every 11 minutes (periodic)
# https://git.busybox.net/busybox/tree/networking/ntpd.c
#

#
# Comment:
# Actually, despite that level of periodic timing being the intention, it doesn't seem to be true in reality.
# As of May 2018 with BusyBox v1.26.2, the relevant behaviour of the ntpd seems to be:
#   * poll for the poll interval (which can be up to 2^12 = 4096 seconds)
#   * determine if the periodic timer has expired, and if so run the script
#
# So the interval between actual runs of this script could be as much as 11min plus the poll_interval, which
# could be up to 4756 seconds (1hr 19min 16sec).  Gaps between running this script of up to 1hr 16min have
# been observed in weekend testing.
#

# Sets these variables
# stratum
# freq_drift_ppm
# poll_interval
# offset
#
# argv[1] is step, periodic, stratum, unsync

uptime=$(awk '{print $1}' /proc/uptime)
pidofntpd=$(pidof ntpd)

if [ 0 -eq 1 ]; then
   (
       echo date: `date "+%Y-%m-%d %H:%M:%S"`
       echo uptime: `uptime`
       echo /proc/uptime: $uptime
       echo pidof ntpd: $pidofntpd
       echo stratum: $stratum
       echo freq_drift_ppm: $freq_drift_ppm
       echo poll_interval: $poll_interval
       echo offset: $offset
       echo action: $1
       echo
   ) >>/tmp/ntp.log
fi

echo uptime=$uptime pid=$pidofntpd stratum=$stratum drift=$freq_drift_ppm poll=$poll_interval offset=$offset action=$1>/tmp/ntpstats.txt
