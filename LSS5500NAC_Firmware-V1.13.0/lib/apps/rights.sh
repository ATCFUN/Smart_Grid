base="/home/apps/store"
dirs="/ /data /libs /user /daemon /public"
for dir in $dirs; do
  dir="$base$dir"
  chown apps:apps $dir
  chmod 0755 $dir
done
