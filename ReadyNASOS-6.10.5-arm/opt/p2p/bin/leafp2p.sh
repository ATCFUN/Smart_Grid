#!/bin/bash
LOG=/var/log/LeafP2P.log

exec 0>/dev/null 1>>$LOG 2>>$LOG

ulimit -l unlimited
ulimit -s unlimited
exec /opt/p2p/bin/leafp2p -n
