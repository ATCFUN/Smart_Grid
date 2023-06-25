#!/bin/bash

# Enables the service
# Format servicectl service [enable|disable]
if [ $# -lt 2 ]
then
	echo "Format $0 service [enable|disable]"
	exit 1;	
fi
	
servicefile=$1.xml
enable=$2
p2pservfldr='/opt/p2p/conf/services/'
servicepath=$p2pservfldr/$servicefile
if [ "$enable" = "enable" ]
then
	sed -i 's/<Enabled>False<\/Enabled>/<Enabled>True<\/Enabled>/' $servicepath 2>/dev/null
else
	sed -i 's/<Enabled>True<\/Enabled>/<Enabled>False<\/Enabled>/' $servicepath 2>/dev/null
fi
/etc/init.d/leafp2p reload-sysconfig
