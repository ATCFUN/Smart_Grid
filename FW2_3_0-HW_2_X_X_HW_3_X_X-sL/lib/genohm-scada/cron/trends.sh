# trends backup
rm -f /lib/genohm-scada/storage/db/trends/*
cp -f /tmp/trends/* /lib/genohm-scada/storage/db/trends 2>&-

# flush to disk
sync
