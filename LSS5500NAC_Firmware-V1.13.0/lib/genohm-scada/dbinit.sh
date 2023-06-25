# storage and base path
BASEDIR=/lib/genohm-scada
STORAGE=$BASEDIR/storage
DBDIR=$STORAGE/db

checkdb() {
  # check that file exists
  local DBFILE="$DBDIR/$1.db"
  [ -e "$DBFILE" ] || return 1

  # check md5
  md5sum -c $DBDIR/$1.md5
  [ "$?" = "0" ] || return 1

  # check integrity
  lua $BASEDIR/dbcheck.lua $DBFILE
  [ "$?" = "0" ] || return 1

  # copy to tmp dir
  cp $DBFILE /tmp/scada.db

  return 0
}

# old db format
[ -e "$STORAGE/scada.db" ] && {
  cp $STORAGE/scada.db $DBDIR/current.db
  mv $STORAGE/scada.db $STORAGE/scada-old.db
  md5sum $DBDIR/current.db > $DBDIR/current.md5
}

# check main db and use backup if main db fails
checkdb current
[ "$?" = "0" ] || checkdb backup

# init database tables
lua $BASEDIR/dbinit.lua
