#!/bin/bash

export LD_LIBRARY_PATH=/opt/replication/usr/lib

/opt/replication/bin/monitord
/opt/replication/bin/brokerd
/opt/replication/etc/init.d/rsyncd.sh start
