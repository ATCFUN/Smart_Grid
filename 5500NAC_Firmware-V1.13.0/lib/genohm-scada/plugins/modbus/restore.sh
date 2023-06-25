SDIR=/lib/genohm-scada/storage/modbus
PDIR=/lib/genohm-scada/plugins/modbus

mkdir -p "$SDIR"
cp $PDIR/profiles/* $SDIR
touch $PDIR/ready
