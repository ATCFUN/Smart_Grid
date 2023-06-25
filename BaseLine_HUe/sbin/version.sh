#!/bin/sh
if [ ! -f /mnt/flash/versions.txt ]; then
	echo "ERROR /etc/versions.txt file not found"
	exit 1
fi
head -n1 /mnt/flash/versions.txt |cut -d' ' -f3 
exit 0
