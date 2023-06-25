#!/bin/sh

MSG='Disks sleeping..'
DURATION=60 # Time in seconds.

# Show message on LCD.
/usr/bin/rnutil rn_lcd -s "$MSG" -p 1 -e $DURATION -k 478
