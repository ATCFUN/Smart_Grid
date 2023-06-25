#!/bin/sh
DST=/lib/genohm-scada/storage

lua /lib/genohm-scada/cron/backup.lua full

cp /usr/share/lua/genohm-scada/userlib.luas $DST 2>&-
cp /usr/share/lua/genohm-scada/initscript.lua $DST 2>&-

rm -rf $DST/user
cp -R /usr/share/lua/user $DST
cp /etc/config/genohm-scada $DST/genohm-scada.config
[ -e /etc/config/gs-modbus ] && cp /etc/config/gs-modbus $DST/gs-modbus.config

# filter settings
rm -f $DST/filter*
cp /etc/eibd/* $DST
uci show eibd | grep -q policy
[ $? -eq 0 ] && {
  file=$DST/filter.sh
  uci show eibd | grep -e policy -e filter | sed 's/eibd/uci set eibd/' > $file
  echo "uci commit eibd" >> $file
  echo "/etc/init.d/eibd restart" >> $file
}
