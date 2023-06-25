# base path
DBDIR=/lib/genohm-scada/storage/db

# remove old backup
[ -e "$DBDIR/backup.db" ] && {
  rm $DBDIR/backup.db
  rm $DBDIR/backup.md5
}

# mark current backup as old
[ -e "$DBDIR/current.db" ] && {
  mv $DBDIR/current.db $DBDIR/backup.db
  md5sum $DBDIR/backup.db > $DBDIR/backup.md5
}

# move new backup
mv $DBDIR/current.tmp $DBDIR/current.db
md5sum $DBDIR/current.db > $DBDIR/current.md5

# redis DBDIR backup
lua -e "require('redis').connect():save()" 2>&-

# flush to disk
sync
