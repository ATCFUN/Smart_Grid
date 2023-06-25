platform_check_image() {
  check_image_header $1 "LM28"
}

platform_do_upgrade() {
  local image="$1"
  local count="$(dd if="$image" ibs=1 count=7 skip=5 2>/dev/null)"
  local skip="$(expr "$count" + 12)"

  # skip 512 byte header
  echo "Writing kernel"
  dd if="$image" of=/dev/mmcblk0p1 ibs=1 obs=512 count="$count" skip=12 seek=1

  echo "Unmounting user partition"
  umount -f /dev/mmcblk0p3

  echo "Erasing rootfs"
  cd /mnt && ls -1 | grep -v -E "^(mnt|home|data)$" | xargs rm -rf
  sync

  echo "Writing rootfs"
  dd if="$image" ibs=1 skip="$skip" 2>/dev/null | tar -xzf - -C /mnt
  sync
}
