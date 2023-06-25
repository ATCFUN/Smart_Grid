#!/bin/sh

ifdown -a
ifconfig eth0 192.168.0.10 up

touch /tmp/tempmode

# start ssh server
enable=$(uci get dropbear.@dropbear[0].enable)
[ "$enable" -eq 0 ] && {
  uci set dropbear.@dropbear[0].enable=1
  uci commit
}

/etc/init.d/dropbear resstart
