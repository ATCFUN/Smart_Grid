killall -9 redis-server
killall -9 lua

sleep 1

rm -f /tmp/scada.db
rm -f /etc/crontabs/store/20-lm-scheduled
rm -f /usr/share/lua/genohm-scada/userlib.lua
rm -f /usr/share/lua/genohm-scada/userlib.luas
rm -f /usr/share/lua/user/*
rm -rf /data/ftp/*
rm -rf /data/apps/*
rm -rf /data/storage/*
rm -rf /db/*
rm -f /lib/genohm-scada/fw/version.md5

cp /lib/genohm-scada/config.default /etc/config/genohm-scada

rm -f /etc/vsftpd.key /etc/vsftpd.crt
rm -f /etc/nginx_sha256.key /etc/nginx_sha256.crt
rm -f /etc/dropbear/*

rm -f /lib/genohm-scada/plugins/modbus/ready

echo -n '' > /data/cbus-params.bin

sed -i 's#^ftp:.*#ftp:!:0:0:99999:7:::#' /etc/shadow
sed -i 's#^apps:.*#apps:!:0:0:99999:7:::#' /etc/shadow

brand=$(cat /lib/genohm-scada/brand)
uci set system.@system[0].hostname="$brand"
uci commit system

echo '-- init script' > /usr/share/lua/genohm-scada/initscript.lua
