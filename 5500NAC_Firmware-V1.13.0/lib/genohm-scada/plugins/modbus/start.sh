mkdir -p /lib/genohm-scada/storage/modbus

PDIR=/lib/genohm-scada/plugins/modbus
lua $PDIR/indexprofiles.lua >/dev/null 2>&1

lua $PDIR/daemon.lua 0 >/dev/null 2>&1 &
lua $PDIR/daemon.lua 1 >/dev/null 2>&1 &
lua $PDIR/daemon.lua 2 >/dev/null 2>&1 &
