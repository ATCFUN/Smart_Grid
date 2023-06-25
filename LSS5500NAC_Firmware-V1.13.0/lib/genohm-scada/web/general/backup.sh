#!/bin/sh
DST=/lib/genohm-scada/storage

lua /lib/genohm-scada/cron/backup.lua full

cp /usr/share/lua/genohm-scada/userlib.luas $DST 2>/dev/null
cp /usr/share/lua/genohm-scada/initscript.lua $DST 2>/dev/null

rm -rf $DST/user
cp -R /usr/share/lua/user $DST
cp /etc/config/genohm-scada $DST/genohm-scada.config
[ -e /etc/config/gs-modbus ] && cp /etc/config/gs-modbus $DST/gs-modbus.config

# filter settings
cp /data/cbus-params.bin $DST/cbus-params.bin
