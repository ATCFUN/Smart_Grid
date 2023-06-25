platform_check_image() {
  check_image $1 "LM28"
}

platform_do_upgrade() {
  local image="$1"

  # skip 512 byte header
  echo "Writing kernel"
  fwsplit "$image" kernel | dd of=/dev/mmcblk0p1 ibs=1M obs=512 seek=1

  echo "Unmounting user partition"
  umount -f /dev/mmcblk0p3

  echo "Erasing rootfs"
  cd /mnt && ls -1 | grep -v -E "^(mnt|home|data|root)$" | xargs rm -rf
  sync

  echo "Writing rootfs"
  fwsplit "$image" data | tar -xzf - -C /mnt
  sync
}
