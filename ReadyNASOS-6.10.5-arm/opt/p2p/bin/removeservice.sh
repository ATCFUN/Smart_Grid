#!/bin/bash

# Removes the service from the service list
# Format removeservice service.xml
if [ $# -lt 1 ]
then
	echo "Format $0 service.xml"
	exit 1;	
fi
	
servicename=$1
servicefile=$1.xml
p2pservfile='/opt/p2p/conf/lnservices.lst'
p2pservfldr='/opt/p2p/conf/services/'
p2pnetserv='/opt/p2p/bin/leafp2p'
(
flock -x 200
if [ -n `grep "$$${servicename}^" ${p2pservfile} 2>/dev/null` ]
then
	sed -i '/^'${servicename}'$/d' ${p2pservfile}
	rm ${p2pservfldr}/${servicefile}
fi
touch ${p2pservfile}
) 200>>${p2pservfile}
/etc/init.d/leafp2p reload
