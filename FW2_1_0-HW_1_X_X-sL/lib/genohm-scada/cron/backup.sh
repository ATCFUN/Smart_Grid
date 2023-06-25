# storage base path
STORAGE=/lib/genohm-scada/storage

# remove old backup
[ -e "$STORAGE/backup.db" ] && {
  rm $STORAGE/backup.db
  rm $STORAGE/backup.md5
}

# mark current backup as old
[ -e "$STORAGE/current.db" ] && {
  mv $STORAGE/current.db $STORAGE/backup.db
  md5sum $STORAGE/backup.db > $STORAGE/backup.md5
}

# move new backup
mv $STORAGE/current.tmp $STORAGE/current.db
md5sum $STORAGE/current.db > $STORAGE/current.md5

# redis storage backup
lua -e "require('redis').connect():save()" 2>&-

# trends backup
rm -f $STORAGE/trends/*
cp -f /tmp/trends/* $STORAGE/trends 2>&-

# flush to disk
sync
