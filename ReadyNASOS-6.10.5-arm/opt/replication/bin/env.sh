#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

# common vars
export LANG=en_US.utf8
export LD_LIBRARY_PATH=/opt/replication/usr/lib

shopt -u xpg_echo

SYS_PREFIX=/opt/replication
PATH=${SYS_PREFIX}/bin:${SYS_PREFIX}/usr/bin:/sbin:/usr/sbin:/bin:/usr/bin
REMOTE_CONFIG=/opt/p2p/conf/lnconfiguration.xml
REPLICATION_CONFIG=${SYS_PREFIX}/etc/replication.conf

# will make snapshots there
SNAP_PREFIX=/var/replicate/snap

# return codes
OK=0
ERROR=1

YES=$OK
NO=$ERROR

IFS_DEFAULT=$IFS
IFS_NEWLINE='
'
IFS_COLON=':'
IFS=$IFS_NEWLINE

# users
ADMIN_USER="admin"
ADMIN_GROUP="admin"

# shm for logs
SHM_SIZE=50M
SHM_FOLDER=/var/replicate/shm

# tmp for responses/resports/configs
TMP_FOLDER="${SHM_FOLDER}/tmp"

# tmp for comm
COMM_TMP_FOLDER="/tmp"

# folder for tasks
TSK_FOLDER="${SHM_FOLDER}/tsk"

# folder for logs
LOG_FOLDER="${SHM_FOLDER}/log"

# folder for job fetch
JOB_FOLDER="${SHM_FOLDER}/job"

# job cache folder
CACHE_FOLDER="${SYS_PREFIX}/var/cache"

# reports spool folder
SPOOL_FOLDER="${SYS_PREFIX}/var/spool"

# max number of retries in spool
SPOOL_RETRIES=24

# rsync stuff
RSYNC="${SYS_PREFIX}/usr/bin/rsync"
RSYNC_EXCL="${SYS_PREFIX}/etc/rsyncd.excl"
RSYNC_LOG="/dev/null"

# rsync over P2P stuff
RSYNC_PORT=6888
RSYNC_CONF="${SYS_PREFIX}/etc/rsyncd.conf"
RSYNC_PID="${SYS_PREFIX}/var/run/rsyncd.pid"
RSYNC_SECRET="${SYS_PREFIX}/etc/rsyncd.secret"

# rsync over LAN stuff
RSYNC_LAN_PORT=6889
RSYNC_LAN_CONF="${SYS_PREFIX}/etc/rsyncd.conf.lan"
RSYNC_LAN_PID="${SYS_PREFIX}/var/run/rsyncd.pid.lan"
RSYNC_LAN_SECRET="${SYS_PREFIX}/etc/rsyncd.secret.lan"

# logger functions
source "${SYS_PREFIX}/bin/log.sh"

# p2p functions
source "${SYS_PREFIX}/bin/p2p.sh"

# task functions
source "${SYS_PREFIX}/bin/task.sh"

# comm functions
source "${SYS_PREFIX}/bin/comm.sh"

# file cache functions
source "${SYS_PREFIX}/bin/cache.sh"

# report spool functions
source "${SYS_PREFIX}/bin/spool.sh"
