#!/bin/bash

# Installs the service to the service list
# Format installservice service.xml
if [ $# -lt 1 ]
then
	echo "Format $0 service.xml"
	exit 1;	
fi
	
servicefile=$1
servicefilename=`basename ${servicefile}`
servicename=`expr ${servicefilename/\.xml/}`
p2pservfile='/opt/p2p/conf/lnservices.lst'
p2pservfldr='/opt/p2p/conf/services/'
p2pnetserv='/opt/p2p/bin/leafp2p'
(
flock -x 200
if [ -z `grep "^${servicename}$" ${p2pservfile} 2>/dev/null` ]
then
	echo ${servicename} >> ${p2pservfile}
	cp ${servicefile} ${p2pservfldr}
fi
touch ${p2pservfile}
) 200>>${p2pservfile}
/etc/init.d/leafp2p reload
