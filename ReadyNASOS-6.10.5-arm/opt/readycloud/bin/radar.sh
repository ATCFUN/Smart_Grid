#!/bin/sh
#-------------------------------------------------------------------------
#  Copyright 2010, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

if [ -f /opt/readycloud/etc/radar_force.flag ]
then
        FORCE='-f'
else
	FORCE=''
fi

/usr/bin/radar -u $FORCE -s radar.netgear.com

