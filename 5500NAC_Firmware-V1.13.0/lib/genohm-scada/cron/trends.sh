# trends backup
rm -f /lib/genohm-scada/storage/db/trends/*
cp -f /tmp/trends/* /lib/genohm-scada/storage/db/trends 2>/dev/null

# flush to disk
sync
