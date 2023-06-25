platform_check_image() {
  check_image $1 "LMX6"
}

platform_do_upgrade() {
  local image="$1"

  echo "Writing kernel"
  fwsplit "$image" kernel | dd of=/dev/mmcblk0p1 bs=1M

  echo "Unmounting user partitions"
  umount -f /dev/mmcblk0p3
  [ -e /dev/mtdblock0 ] && umount -f /dev/mtdblock0

  echo "Erasing rootfs"
  cd /mnt && ls -1 | grep -v -E "^(mnt|home|data|root)$" | xargs rm -rf
  sync

  echo "Writing rootfs"
  fwsplit "$image" data | tar -xzf - -C /mnt
  sync
}
