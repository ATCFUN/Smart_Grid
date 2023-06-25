mkdir -p /lib/genohm-scada/storage/modbus

PDIR=/lib/genohm-scada/plugins/modbus
lua $PDIR/indexprofiles.lua >&- 2>&-
lua $PDIR/daemon.lua >&- 2>&- &
