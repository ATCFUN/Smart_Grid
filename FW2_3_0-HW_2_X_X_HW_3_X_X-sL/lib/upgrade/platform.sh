platform_check_image() {
  check_image_header $1 "LMX6"
}

platform_do_upgrade() {
  local image="$1"
  local count="$(dd if="$image" ibs=1 count=7 skip=5 2>/dev/null)"
  local skip="$(expr "$count" + 12)"

  echo "Writing kernel"
  dd if="$image" of=/dev/mmcblk0p1 ibs=1 obs=1M count="$count" skip=12

  echo "Unmounting user partitions"
  umount -f /dev/mmcblk0p3
  [ -e /dev/mtdblock0 ] && umount -f /dev/mtdblock0

  echo "Erasing rootfs"
  cd /mnt && ls -1 | grep -v -E "^(mnt|home|data|root)$" | xargs rm -rf
  sync

  echo "Writing rootfs"
  dd if="$image" ibs=1 obs=1M skip="$skip" 2>/dev/null | tar -xzf - -C /mnt
  sync
}
