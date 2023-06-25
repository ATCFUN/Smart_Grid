# base path
DBDIR=/lib/genohm-scada/storage/db

# remove old backup
rm -f $DBDIR/backup.db
rm -f $DBDIR/backup.md5

# mark current backup as old
[ -e "$DBDIR/current.db" ] && {
  mv $DBDIR/current.db $DBDIR/backup.db
  md5sum $DBDIR/backup.db > $DBDIR/backup.md5
}

# move new backup
mv /tmp/current.tmp $DBDIR/current.db
md5sum $DBDIR/current.db > $DBDIR/current.md5

# redis db backup
lua -e "require('redis').connect():save()" 2>/dev/null

# flush to disk
sync
