#!/bin/sh
NOREBOOT=$1

BACKUP=/etc/config_default.tar.gz
[ -f "$BACKUP" ] && tar -xzf "$BACKUP" -C /

RESET=/lib/genohm-scada/reset.sh
[ -e "$RESET" ] && sh $RESET

# force default network settings
uci delete network.lan
uci set network.lan=interface
uci set network.lan.ifname=eth0
uci set network.lan.proto=static
uci set network.lan.ipaddr=192.168.0.10
uci set network.lan.netmask=255.255.255.0
uci commit network

[ -z "$NOREBOOT" ] && reboot
