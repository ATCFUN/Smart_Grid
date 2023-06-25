link() {
  [ -e "$2" ] || ln -sf "$1" "$2"
}

# create directory structure
mkdir -p /home
mkdir -p /data/apps

link /data/apps /home/apps

mkdir -p /home/apps/store/data
mkdir -p /home/apps/store/libs
mkdir -p /home/apps/store/daemon
mkdir -p /home/apps/store/cron
mkdir -p /home/apps/store/user
mkdir -p /home/apps/store/public

# check if user should be created
grep -q apps: /etc/passwd || adduser -h /home/apps/store -s /bin/false -D apps apps
grep -q apps: /etc/group || addgroup apps
adduser apps apps
ftpusers=/etc/vsftpd.users
[ -e "$ftpusers" ] && {
  grep -q apps "$ftpusers" || echo apps >> "$ftpusers"
}

# config file
srccfg=/lib/apps/config.default
dstcfg=/etc/config/apps
[ -e $srccfg ] && {
  [ -e $dstcfg ] || cp $srccfg $dstcfg
}

# opkg
mkdir -p /tmp/apps/lock
link /tmp/apps /home/apps/var

# uci
mkdir -p /tmp/apps/.uci

# web server links
mkdir -p /www/apps
link /home/apps/store/data /www/apps/data
link /home/apps/store/user /www/user
link /home/apps/store/public /www/public

# lp script storage
mkdir -p /tmp/lp/session

# .lua libs
link /home/apps/store/libs /usr/share/lua/applibs
link /home/apps/store/libs /usr/share/lua/custom
# .so and .lua libs
link /home/apps/store/libs /usr/lib/lua/applibs

# auto-install apps
[ -e /lib/apps/preinstall -a ! -e /lib/apps/preinstall/complete ] && {
  opkg -o /home/apps install /lib/apps/preinstall/*.ipk
  touch /lib/apps/preinstall/complete
}

# set proper permissions
sh /lib/apps/rights.sh

# install crontab for update check
lua /lib/apps/update-cron.lua
