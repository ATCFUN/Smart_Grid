#!/bin/sh
# Copyright (C) 2006-2014 OpenWrt.org
# Copyright (C) 2006 Fokus Fraunhofer <carsten.tittel@fokus.fraunhofer.de>
# Copyright (C) 2010 Vertical Communications

append() {
  local var="$1"
  local value="$2"
  local sep="${3:- }"

  eval "export -n -- \"$var=\${$var:+\${$var}\${value:+\$sep}}\$value\""
}

CONFIG_APPEND=
config_load() {
  [ -n "$IPKG_INSTROOT" ] && return 0
  local PACKAGE="$1"
  local DATA
  local RET
  local VAR

  for VAR in $CONFIG_LIST_STATE; do
    export -n CONFIG_${VAR}=
    export -n CONFIG_${VAR}_LENGTH=
  done
  export -n CONFIG_LIST_STATE=
  export -n CONFIG_SECTIONS=
  export -n CONFIG_NUM_SECTIONS=0
  export -n CONFIG_SECTION=

  DATA="$(/sbin/uci -P /var/state -S -n export "$PACKAGE" 2>/dev/null)"
  RET="$?"
  [ "$RET" != 0 -o -z "$DATA" ] || eval "$DATA"
  unset DATA

  return "$RET"
}

uci_revert_state() {
  local PACKAGE="$1"
  local CONFIG="$2"
  local OPTION="$3"

  /sbin/uci -P /var/state revert "$PACKAGE${CONFIG:+.$CONFIG}${OPTION:+.$OPTION}"
}

uci_set_state() {
  local PACKAGE="$1"
  local CONFIG="$2"
  local OPTION="$3"
  local VALUE="$4"

  [ "$#" = 4 ] || return 0
  /sbin/uci -P /var/state set "$PACKAGE.$CONFIG${OPTION:+.$OPTION}=$VALUE"
}

uci_toggle_state() {
  uci_revert_state "$1" "$2" "$3"
  uci_set_state "$1" "$2" "$3" "$4"
}

uci_get() {
  local PACKAGE="$1"
  local CONFIG="$2"
  local OPTION="$3"
  local DEFAULT="$4"
  local STATE="$5"

  /sbin/uci ${STATE:+-P $STATE} -q get "$PACKAGE${CONFIG:+.$CONFIG}${OPTION:+.$OPTION}"
  RET="$?"
  [ "$RET" -ne 0 ] && [ -n "$DEFAULT" ] && echo "$DEFAULT"
  return "$RET"
}

uci_get_state() {
  uci_get "$1" "$2" "$3" "$4" "/var/state"
}

package() {
  return 0
}

config() {
  local cfgtype="$1"
  local name="$2"

  export -n CONFIG_NUM_SECTIONS=$(($CONFIG_NUM_SECTIONS + 1))
  name="${name:-cfg$CONFIG_NUM_SECTIONS}"
  append CONFIG_SECTIONS "$name"
  export -n CONFIG_SECTION="$name"
  export -n "CONFIG_${CONFIG_SECTION}_TYPE=$cfgtype"
}

option() {
  local varname="$1"; shift
  local value="$*"

  export -n "CONFIG_${CONFIG_SECTION}_${varname}=$value"
}

list() {
  local varname="$1"; shift
  local value="$*"
  local len

  config_get len "$CONFIG_SECTION" "${varname}_LENGTH" 0
  [ $len = 0 ] && append CONFIG_LIST_STATE "${CONFIG_SECTION}_${varname}"
  len=$(($len + 1))
  config_set "$CONFIG_SECTION" "${varname}_ITEM$len" "$value"
  config_set "$CONFIG_SECTION" "${varname}_LENGTH" "$len"
  append "CONFIG_${CONFIG_SECTION}_${varname}" "$value" " "
}

# config_get <variable> <section> <option> [<default>]
# config_get <section> <option>
config_get() {
  case "$3" in
    "") eval echo "\${CONFIG_${1}_${2}:-\${4}}";;
    *)  eval export -n -- "${1}=\${CONFIG_${2}_${3}:-\${4}}";;
  esac
}

# config_get_bool <variable> <section> <option> [<default>]
config_get_bool() {
  local _tmp
  config_get _tmp "$2" "$3" "$4"
  case "$_tmp" in
    1|on|true|yes|enabled) _tmp=1;;
    0|off|false|no|disabled) _tmp=0;;
    *) _tmp="$4";;
  esac
  export -n "$1=$_tmp"
}

config_set() {
  local section="$1"
  local option="$2"
  local value="$3"
  local old_section="$CONFIG_SECTION"

  CONFIG_SECTION="$section"
  option "$option" "$value"
  CONFIG_SECTION="$old_section"
}

config_foreach() {
  local ___function="$1"
  [ "$#" -ge 1 ] && shift
  local ___type="$1"
  [ "$#" -ge 1 ] && shift
  local section cfgtype

  [ -z "$CONFIG_SECTIONS" ] && return 0
  for section in ${CONFIG_SECTIONS}; do
    config_get cfgtype "$section" TYPE
    [ -n "$___type" -a "x$cfgtype" != "x$___type" ] && continue
    eval "$___function \"\$section\" \"\$@\""
  done
}

config_list_foreach() {
  [ "$#" -ge 3 ] || return 0
  local section="$1"; shift
  local option="$1"; shift
  local function="$1"; shift
  local val
  local len
  local c=1

  config_get len "${section}" "${option}_LENGTH"
  [ -z "$len" ] && return 0
  while [ $c -le "$len" ]; do
    config_get val "${section}" "${option}_ITEM$c"
    eval "$function \"\$val\" \"\$@\""
    c="$(($c + 1))"
  done
}

default_prerm() {
  local name
  name=$(basename ${1%.*})
  [ -f /usr/lib/opkg/info/${name}.prerm-pkg ] && . /usr/lib/opkg/info/${name}.prerm-pkg
  for i in `cat /usr/lib/opkg/info/${name}.list | grep "^/etc/init.d/"`; do
    $i disable
    $i stop
  done
  return 0
}

default_postinst() {
  local root="${IPKG_INSTROOT}"
  local pkgname="$(basename ${1%.*})"
  local rusers="$(sed -ne 's/^Require-User: *//p' $root/usr/lib/opkg/info/${pkgname}.control 2>/dev/null)"
  local ret=0

  if [ -n "$rusers" ]; then
    local tuple oIFS="$IFS"
    for tuple in $rusers; do
      local uid gid uname gname

      IFS=":"
      set -- $tuple; uname="$1"; gname="$2"
      IFS="="
      set -- $uname; uname="$1"; uid="$2"
      set -- $gname; gname="$1"; gid="$2"
      IFS="$oIFS"

      if [ -n "$gname" ] && [ -n "$gid" ]; then
        group_exists "$gname" || group_add "$gname" "$gid"
      elif [ -n "$gname" ]; then
        group_add_next "$gname"; gid=$?
      fi

      if [ -n "$uname" ]; then
        user_exists "$uname" || user_add "$uname" "$uid" "$gid"
      fi

      if [ -n "$uname" ] && [ -n "$gname" ]; then
        group_add_user "$gname" "$uname"
      fi

      unset uid gid uname gname
    done
  fi

  if [ -f "$root/usr/lib/opkg/info/${pkgname}.postinst-pkg" ]; then
    ( . "$root/usr/lib/opkg/info/${pkgname}.postinst-pkg" )
    ret=$?
  fi

  if [ "$PKG_UPGRADE" != "1" ]; then
    local shell="$(which bash)"
    for i in $(grep -s "^/etc/init.d/" "$root/usr/lib/opkg/info/${pkgname}.list"); do
      if [ -n "$root" ]; then
        ${shell:-/bin/sh} "$root/etc/rc.common" "$root$i" enable
      else
        "$i" enable
        "$i" start
      fi
    done
  fi

  return $ret
}

include() {
  local file

  for file in $(ls $1/*.sh 2>/dev/null); do
    . $file
  done
}

uci_apply_defaults() {
  cd /etc/uci-defaults || return 0
  files="$(ls)"
  [ -z "$files" ] && return 0
  mkdir -p /tmp/.uci
  for file in $files; do
    ( . "./$(basename $file)" ) && rm -f "$file"
  done
  uci commit
}

group_add() {
  local name="$1"
  local gid="$2"
  local rc
  [ -f "${IPKG_INSTROOT}/etc/group" ] || return 1
  [ -n "$IPKG_INSTROOT" ] || lock /var/lock/group
  echo "${name}:x:${gid}:" >> ${IPKG_INSTROOT}/etc/group
  rc=$?
  [ -n "$IPKG_INSTROOT" ] || lock -u /var/lock/group
  return $rc
}

group_exists() {
  grep -qs "^${1}:" ${IPKG_INSTROOT}/etc/group
}

group_add_next() {
  local gid gids
  gid=$(grep -s "^${1}:" ${IPKG_INSTROOT}/etc/group | cut -d: -f3)
  [ -n "$gid" ] && return $gid
  gids=$(cat ${IPKG_INSTROOT}/etc/group | cut -d: -f3)
  gid=100
  while [ -n "$(echo $gids | grep $gid)" ] ; do
          gid=$((gid + 1))
  done
  group_add $1 $gid
  return $gid
}

group_add_user() {
  local grp delim=","
  grp=$(grep -s "^${1}:" ${IPKG_INSTROOT}/etc/group)
  [ -z "$(echo $grp | cut -d: -f4 | grep $2)" ] || return
  [ -n "$(echo $grp | grep ":$")" ] && delim=""
  [ -n "$IPKG_INSTROOT" ] || lock /var/lock/passwd
  sed -i "s/$grp/$grp$delim$2/g" ${IPKG_INSTROOT}/etc/group
  [ -n "$IPKG_INSTROOT" ] || lock -u /var/lock/passwd
}

user_add() {
  local name="${1}"
  local uid="${2}"
  local gid="${3}"
  local desc="${4:-$1}"
  local home="${5:-/var/run/$1}"
  local shell="${6:-/bin/false}"
  local rc
  [ -z "$uid" ] && {
    uids=$(cat ${IPKG_INSTROOT}/etc/passwd | cut -d: -f3)
    uid=100
    while [ -n "$(echo $uids | grep $uid)" ] ; do
            uid=$((uid + 1))
    done
  }
  [ -z "$gid" ] && gid=$uid
  [ -f "${IPKG_INSTROOT}/etc/passwd" ] || return 1
  [ -n "$IPKG_INSTROOT" ] || lock /var/lock/passwd
  echo "${name}:x:${uid}:${gid}:${desc}:${home}:${shell}" >> ${IPKG_INSTROOT}/etc/passwd
  echo "${name}:x:0:0:99999:7:::" >> ${IPKG_INSTROOT}/etc/shadow
  rc=$?
  [ -n "$IPKG_INSTROOT" ] || lock -u /var/lock/passwd
  return $rc
}

user_exists() {
  grep -qs "^${1}:" ${IPKG_INSTROOT}/etc/passwd
}
