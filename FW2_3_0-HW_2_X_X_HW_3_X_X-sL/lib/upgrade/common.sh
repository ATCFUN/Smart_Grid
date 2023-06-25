export ROOTFS_KEEP_MOUNTED=1
. /lib/functions.sh
. /lib/upgrade/platform.sh

libs() {
  ldd $* 2>/dev/null | sed -r 's/(.* => )?(.*) .*/\2/';
}

install_file() {
  for file in "$@"; do
    dest="/tmp/root/$file"
    [ -f $file -a ! -f $dest ] && {
      dir="$(dirname $dest)"
      mkdir -p "$dir"
      cp $file $dest
    }
  done
}

install_bin() {
  src=$1
  files=$1
  [ -x "$src" ] && files="$src $(libs $src)"
  install_file $files
  shift
  for link in "$@"; do {
    dest="/tmp/root/$link"
    dir="$(dirname $dest)"
    mkdir -p "$dir"
    [ -f "$dest" ] || ln -s $src $dest
  }; done
}

supivot() {
  /bin/mount | grep "on $1 type" 2>&- 1>&- || /bin/mount -o bind $1 $1
  mkdir -p $1$2 $1/proc $1/sys $1/dev $1/tmp && \
  /bin/mount -o noatime,move /proc $1/proc && \
  pivot_root $1 $1$2 || {
    /bin/umount -l $1 $1
    return 1
  }

  /bin/mount -o noatime,move $2/sys /sys
  /bin/mount -o noatime,move $2/dev /dev
  /bin/mount -o noatime,move $2/tmp /tmp
  return 0
}

run_ramfs() {
  install_bin /bin/busybox /bin/ash /bin/sh /bin/mount /bin/umount  \
    /sbin/pivot_root /sbin/reboot /bin/sync /bin/dd /bin/grep       \
    /bin/cp /bin/mv /bin/tar /usr/bin/md5sum "/usr/bin/[" /bin/dd \
    /bin/vi /bin/ls /bin/cat /usr/bin/awk /usr/bin/hexdump    \
    /bin/sleep /bin/zcat /usr/bin/bzcat /usr/bin/printf /usr/bin/wc \
    /bin/cut /usr/bin/printf /bin/sync /bin/mkdir /bin/rmdir  \
    /bin/rm /usr/bin/basename /bin/kill /bin/chmod /usr/bin/expr /usr/bin/xargs

  [ -x /sbin/mtd ] && install_bin /sbin/mtd

  install_file /etc/resolv.conf /lib/*.sh /lib/functions/*.sh /lib/upgrade/*.sh

  supivot /tmp/root /mnt || {
    echo "Failed to switch over to ramfs, please reboot"
    exit 1
  }

  [ "$ROOTFS_KEEP_MOUNTED" -eq 1 ] || {
    /bin/mount -o remount,ro /mnt
    /bin/umount -l /mnt
  }

  exec /bin/busybox ash -c "$*"
}

kill_remaining() {
  local sig="$1"
  echo -n "Sending $sig to processes:"

  local stat
  for stat in /proc/[0-9]*/stat; do
    [ -f "$stat" ] || continue

    local pid name state ppid rest
    read pid name state ppid rest < $stat
    name="${name#(}"; name="${name%)}"

    local cmdline
    read cmdline < /proc/$pid/cmdline

    [ -n "$cmdline" ] || continue

    case "$name" in
      *ash*|*init*|*watchdog*|*dropbear*|*login*|*wpad*) : ;;
      *)
        if [ $pid -ne $$ ] && [ $ppid -ne $$ ]; then
          echo -n " $name"
          kill -$sig $pid 2>/dev/null
        fi
      ;;
    esac
  done
  echo ""
}

ask_bool() {
  local msg="$1"
  [ "$INTERACTIVE" -eq 0 ] && return 0

  echo -n "$msg (Y/n): "

  local answer
  read answer

  [ ! "$answer" = "n" ]
}

CONF_TAR=/tmp/sysupgrade.tgz

do_upgrade() {
  echo "Performing system upgrade"
  platform_do_upgrade "$ARGV"

  [ "$SAVE_CONFIG" -eq 1 ] && {
    echo "Writing config"

    if [ "$ROOTFS_KEEP_MOUNTED" -eq 1 ]; then
      tar -xzf "$CONF_TAR" -C /mnt
    else
      mtd jffs2write "$CONF_TAR" rootfs
    fi

    sync
  }

  ask_bool "Reboot" && {
    echo "Rebooting system"
    reboot -f
  }
}

do_save_conffiles() {
  local file=/tmp/sysupgrade.conffiles
  echo "Saving config files"
  ( find $(sed -ne '/^[[:space:]]*$/d; /^#/d; p' \
    /lib/upgrade/keep.d/* 2>/dev/null) \
    -type f 2>/dev/null;
    opkg list-changed-conffiles 2>/dev/null ) | sort -u > "$file"
  tar -czf "$CONF_TAR" -T "$file" 2>/dev/null
}

check_image_header() {
  local magic=$(head -c 4 "$1")
  local header="$2"
  local file="/lib/upgrade/header"

  [ -e "$file" ] && header=$(cat "$file")
  [ "$magic" = "$header" ]
}
