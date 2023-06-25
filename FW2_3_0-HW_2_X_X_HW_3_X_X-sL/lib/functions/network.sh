#!/bin/sh
# Copyright (C) 2006-2011 OpenWrt.org

. /lib/functions/service.sh

add_dns() {
  local cfg="$1"; shift
  local dns

  remove_dns "$cfg"
  [ -n "$cfg" ] && uci_toggle_state network "$cfg" resolv_dns "$@"

  for dns in "$@"; do
    grep -qsE "^nameserver ${dns//./\\.}$" /tmp/resolv.conf.auto || \
      echo "nameserver $dns" >> /tmp/resolv.conf.auto
  done
}

remove_dns() {
  local cfg="$1"

  [ -n "$cfg" ] && {
    [ -f /tmp/resolv.conf.auto ] && {
      local dns=$(uci_get_state network "$cfg" resolv_dns)
      for dns in $dns; do
        sed -i -e "/^nameserver ${dns//./\\.}$/d" /tmp/resolv.conf.auto
      done
    }

    uci_revert_state network "$cfg" dns
  }
}

setup_interface_static() {
  local iface="$1"
  local config="$2"
  local ipaddr netmask gateway dns

  config_get ipaddr "$config" ipaddr
  config_get netmask "$config" netmask
  config_get gateway "$config" gateway
  config_get dns "$config" dns

  [ -n "$ipaddr" -a -n "$netmask" ] && {
    ifconfig "$iface" "$ipaddr" netmask "$netmask"

    [ -n "$gateway" ] && route add default gw "$gateway" dev "$iface"
    [ -n "$dns" ] && add_dns "$config" $dns
  }
}

setup_interface_dhcp() {
  local iface="$1"
  local pidfile="/var/run/dhcp-${iface}.pid"

  # kill running udhcpc
  SERVICE_PID_FILE="$pidfile" \
  service_stop /sbin/udhcpc

  # start new udhcpc
  SERVICE_DAEMONIZE=1 \
  SERVICE_PID_FILE="$pidfile" \
  service_start /sbin/udhcpc \
    -p "$pidfile" \
    -i "$iface" \
    -f -t 0 \
    -x "hostname:$(cat /proc/sys/kernel/hostname)"
}

setup_interface() {
  local iface="$1"
  local config="$2"
  local proto bridge macaddr mtu

  [ -z "$iface" -o -z "$config" ] && return 0

  config_get proto "$config" proto
  config_get bridge "$config" bridge
  config_get macaddr "$config" macaddr
  config_get mtu "$config" mtu

  [ -n "$bridge" ] && {
    brctl addbr br0 >&- 2>&-
    brctl addif br0 "$iface" >&- 2>&-
    ifconfig "$iface" 0.0.0.0 up
    iface=br0
  }

  ifconfig "$iface" >&- 2>&- && {
    ifconfig "$iface" 0.0.0.0 ${macaddr:+hw ether $macaddr} ${mtu:+mtu $mtu} up

    [ "$proto" = "static" ] && setup_interface_static "$iface" "$config"
    [ "$proto" = "dhcp" ] && setup_interface_dhcp "$iface"
  }
}
