#!/bin/bash

#
# This file is executed only when upgrading OS.
# After execution, the file is removed.
#
# For test, copy this file to /frontview/bin, and 'systemctl enable readynas-upgrade.service', then reboot.
# After reboot, check with 'journalctl -a --no-pager _SYSTEMD_UNIT=readynas-upgrade.service'.

THISFILE=$0
OLDVER=$((`cat /var/readynasd/.update_from 2>/dev/null`))
HERE=$PWD
APACHE_PEM_FILE=/etc/frontview/apache/apache2.pem

export DEBIAN_FRONTEND=noninteractive

#### cleanup old stuff.
ldconfig
# rnp2 package will replace 'rnp2-installer' with 'rnp2'
[ dpkg -s rnp2-installer >/dev/null 2>&1 ] && dpkg --purge rnp2-installer
if [ -d /apps/photos2 -a ! -d /apps/photos2/bin ]; then
  rm -rf /apps/photos2 || echo "Cannot remove photos2"
fi
# Remove avplus package.
dpkg -s avplus >/dev/null 2>&1 && dpkg --purge avplus
if [ -d /apps/avplus ]; then
  rm -rf /apps/avplus || echo "Cannot remove avplus"
fi
if [ -d /apps/plexmediaserver -a ! -d /apps/plexmediaserver/Binaries ]; then
  rm -rf /apps/plexmediaserver || echo "Cannot remove plexmediaserver"
fi
for d in $(find /apps -maxdepth 1 -mindepth 1 -type d -not -name ".*"); do
   [ -e $d/.localapp ] || continue
   [ -e $d/.uninitialized ] || continue
   rm -rf $d || echo "Cannot remove $(basename $d)"
done

# Pre-Installed Application
if [ -d /preinstall-dpkg ]; then
  if [ -d /apps -a $(stat -c %d /) -ne $(stat -c %d /apps) ]; then
    for deb in $(find /preinstall-dpkg -maxdepth 1 -name "*.deb" -print); do
      dpkg --force-overwrite --refuse-downgrade -i $deb || echo "Problem installing $deb"
    done
  fi
  rm -rf /preinstall-dpkg
fi


# fix bug#12192
sed -i -e 's/^sync:x:4:65534/sync:x:4:98/' /etc/passwd
sed -i -e '/:x:65534:/d' /etc/passwd

# fix permission of /{vol}/._share
find / -maxdepth 2 -mindepth 2 -type d -name '._share' -exec chmod 0755 {} \;

# bug#12245. We always enable HTTP port.
sed -i -e '/^HTTP=/cHTTP=1' /etc/default/services
sed -i -e 's/^\([^=]*\)=(null)$/\1=/' /etc/default/services

# /{vol}/home directory might be set to 0700 if created new vol using 6.0.5-T1295 or older
[ -d /home ] && chmod 0755 /home

# move bonjour discovery to within netatalk/samba
if [ -f /etc/avahi/services/timemachine.service ] ; then
  awk -F'[,<=]' '/dk0=/ { print "\"" $6 "\" " $8 }' /etc/avahi/services/timemachine.service > /var/netatalk/afp_voluuid.conf
  rm -f /etc/avahi/services/timemachine.service
fi

if [ $OLDVER -gt 0 -a $OLDVER -le 6000004 ]; then
  # Fix DLNA misconfiguration
  sed -i -e '/^network_interface=/d' \
	-e '/^serial=/d' \
	-e '/^model_number=/d' \
	-e 's#^album_art_names=.*$#album_art_names=Cover.jpg/cover.jpg/AlbumArtSmall.jpg/albumartsmall.jpg/AlbumArt.jpg/albumart.jpg/Album.jpg/album.jpg/Folder.jpg/folder.jpg/AlbumArt_{*/Thumb.jpg/thumb.jpg#' \
	/etc/minidlna.conf
fi

# We no longer use readystatsd.service.
if [ -e /lib/systemd/system/readystatsd.service ]; then
  systemctl disable readystatsd.service || true
  rm /lib/systemd/system/readystatsd.service
fi

# if HTTPS_PORT=xxx where xxx is less than 1024, force disable secondary port
if [ $OLDVER -gt 0 -a $OLDVER -le 6000006 ]; then
  awk -F= '/^HTTPS_PORT=/{if ($2<1024) {print "HTTPS_PORT=0"}else{print};next} {print}' \
    /etc/default/services > /etc/default/services-new && mv /etc/default/services-new /etc/default/services
fi

# We no longer use genie.service
if grep -q APPGENIE=1 /etc/default/services ; then
  systemctl disable genie.service && systemctl stop genie.service
  sed -i '/^APPGENIE=/d' /etc/default/services
fi

# we rename rn-dictionary-update.sh to rn-update.sh, and take care other deb update in 'update' section
[ -f /frontview/bin/rn-dictionary-update.sh ] && rm /frontview/bin/rn-dictionary-update.sh

# 6.1.0 (6.0.9+) support Taiwanese
if [ $OLDVER -gt 0 -a $OLDVER -le 6000008 ]; then
  sed -i -e '/^LANGUAGES_SUPPORTED=/s/^.*$/LANGUAGES_SUPPORTED=en-us\/utf-8,de\/utf-8,fr\/utf-8,ja\/utf-8,zh-cn\/utf-8,ru\/utf-8,sv\/utf-8,pt\/utf-8,it\/utf-8,es\/utf-8,pl\/utf-8,cs\/utf-8,nl\/utf-8,ko\/utf-8,zh-tw\/utf-8/' \
    /etc/default/services
fi

# READYDROP.conf should be site specific for security reasons
[ -e /etc/apache2/conf.d/READYDROP.conf ] && rm /etc/apache2/conf.d/READYDROP.conf

# Older version enabled NFSv4 as default
if ! grep -q "^NFS_V4=" /etc/default/services ; then
  if grep -q "^NFS=1" /etc/default/services ; then
    echo "NFS_V4=1" >>/etc/default/services
  else
    echo "NFS_V4=0" >>/etc/default/services
  fi
fi

# 6.0.8 set USER_HOME_DIRECTORY_FTP=1, but proftpd.conf is not include homes.
if [ $OLDVER -gt 0 -a $OLDVER -le 6000008 ]; then
  sed -i -e "s/^USER_HOME_DIRECTORY_FTP=.*$/USER_HOME_DIRECTORY_FTP=0/" /etc/default/services
fi

# Make sure if Home Share for FTP is enabled, then need bind mount.
if grep -q "^USER_HOME_DIRECTORY_FTP=1$" /etc/default/services ; then
  [ -d /var/ftp/home ] || mkdir -p /var/ftp/home
  if [ $(stat -c %d /var/ftp) -eq $(stat -c %d /var/ftp/home) -a -d /home ]; then
     mount --bind /home /var/ftp/home
  fi
else
  if [ -d /var/ftp/home ]; then
    umount /var/ftp/home || true
    rmdir /var/ftp/home || true
  fi
fi

# Make leafp2p log to systemd journal instead if its own log file.
if [ $OLDVER -gt 0 -a $OLDVER -le 6001006 ]; then
  sed -i 's#<LogType>1</LogType>#<LogType>0</LogType>#' /opt/p2p/conf/lnconfiguration.xml
fi

# Rework HTTP share/admin redirection
if [ $OLDVER -gt 0 -a $OLDVER -lt 6002000 ] && grep -q '^RewriteRule \^/\$ ' /etc/frontview/apache/http-redirect.conf; then
  grep '^RewriteRule \^/\$ ' /etc/frontview/apache/http-redirect.conf > /etc/frontview/apache/http-share-redirect.conf
  sed -i '/RewriteRule ^\/$ /d' /etc/frontview/apache/http-redirect.conf
fi

# If the admin home directory is empty and not a subvolume, delete it so PAM can make him a subvolume.
awk -F= '/What=/ { system("rmdir " $2 "/admin"); }' /lib/systemd/system/home.mount 2>/dev/null

# Don't disallow symlinks by default.  Wide links are off, so this isn't a problem, and we need symlinks for vfs_snapper.
sed -i '/follow symlinks/d' /etc/samba/smb.conf

# Fix $home_folder table unhandle Administrator id update after joining ADS.  6.2.4/6.3.4
sqlite3 -cmd '.timeout 5000' /var/readynasd/db.sq3 'delete from `$home_folder` where user_id=-500' 2>/dev/null

# forked-daapd should log to systemd journal rather than his own log file.
sed -i '/logfile = ".var.log.forked-daapd.log"/d' /etc/forked-daapd.conf
[ -f /var/log/forked-daapd.log ] && rm /var/log/forked-daapd.log

# create firmware upgrade flag
echo $OLDVER > /var/run/readynasd/.fw_upgrade_flag
if [ $OLDVER -gt 0 ]; then
  touch /etc/frontview/.fw_upgrade_flag_for_admin_gui
else
  touch /etc/frontview/.fw_reset_flag_for_admin_gui
fi

# generate custom DH parameters for apache2 mode_ssl
if [ -f "$APACHE_PEM_FILE" ] && ! grep -Fq "BEGIN DH PARAMETERS" "$APACHE_PEM_FILE"; then
  openssl dhparam -dsaparam 1024 2>/dev/null >> $APACHE_PEM_FILE
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6004000 ]; then
  if ! dump_sysflags SYS_FLAG_RACKMOUNT; then
    for V in `awk '/LABEL=/ && /btrfs/ { print $2 }' /etc/fstab`; do
      btrfs quota enable $V
      btrfs quota rescan $V
    done
  fi

  # update sshd_config for rsync over ssh
  sed -i '/AuthorizedKeysFile/d' /etc/ssh/sshd_config
  echo "AuthorizedKeysFile %h/.ssh/authorized_keys %h/.ssh/ssh_authorized_keys" >> /etc/ssh/sshd_config
  systemctl reload-or-try-restart ssh
fi

# If the hostname was changed after user accounts were created, all the accounts would have the old domain name
if [ $OLDVER -gt 0 -a $OLDVER -lt 6004002 ]; then
  pdbedit --force-initialized-passwords
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6005000 ]; then
  if grep -Fq "security = user" /etc/samba/smb.conf; then
    PREFIX="#dashboard:"
  fi

  sed -i "/idmap config \* : range/i ${PREFIX}idmap config \* : backend = tdb" /etc/samba/smb.conf
fi

# We may have added a bad fstab entry on systems with encrypted volumes, which cases a 90-second boot delay
if [ $OLDVER -gt 0 -a $OLDVER -lt 6006000 ]; then
  sed -i '/LABEL=crypto_LUKS.*crypto_LUKS crypto_ defaults/d' /etc/fstab
fi

# ctscand has been replaced by clamav
if [ -e /etc/systemd/system/multi-user.target.wants/ctscand.service ]; then
  mv /etc/systemd/system/multi-user.target.wants/{ctscand,clamav-daemon}.service
fi

# 6.7.0 allows users to enable/disable the anti-virus email notification.
if [ $OLDVER -gt 0 -a $OLDVER -lt 6007000 ]; then
  if ! grep -q MONITOR=.*antivirus /etc/default/services; then
    sed -i '/^MONITOR=/s/$/,antivirus/' /etc/default/services
  fi
fi

# ARM boxes with the PHP Apache module may not have enabled it
if [ $OLDVER -gt 0 -a $OLDVER -lt 6007005 ]; then
  if [ -f /etc/apache2/mods-available/php5.load -a \
       -f /usr/lib/apache2/modules/libphp5.so -a \
       ! -L /etc/apache2/mods-enabled/php5.load ]; then
    a2enmod -q php5
  fi
fi

# Update ClamAV config if older version less than 6.8.0.
# Add home folder to config file from 6.8.0.
if [ $OLDVER -gt 0 -a $OLDVER -lt 6008000 ]; then
  >/var/readynasd/.need_export
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6009000 ]; then
  # readycloud owner's group migration. Change primary group to 97, secondary group to 98
  CLOUD_OWNER=`/opt/readycloud/bin/rxml /opt/readycloud/etc/registration.conf /registration/owner`
  if [ ! -n "$CLOUD_OWNER" ]; then
    CLOUD_OWNER=`awk -F'[<>]' '/<owner>/ { print $3 }' /opt/readycloud/etc/registration.conf`
  fi
  if [ -n "$CLOUD_OWNER" ]; then
    usermod -g ready-cloud $CLOUD_OWNER
    usermod -a -G admin $CLOUD_OWNER
  fi

  # 6.9.0 allows users to enable/disable the power email notification.
  if ! grep -q MONITOR=.*power /etc/default/services; then
    sed -i '/^MONITOR=/s/$/,power/' /etc/default/services
  fi
  if ! grep -q MONITOR=.*ups /etc/default/services; then
    sed -i '/^MONITOR=/s/$/,ups/' /etc/default/services
  fi
  # fix smb.conf rid mode when upgrading to 6.9.0
  if grep -Fq "security = ads" /etc/samba/smb.conf; then
    DOMAIN=`awk '/workgroup/ { print $3 }' /etc/samba/smb.conf`
    if [ -n "$DOMAIN" ] && grep -Fq "idmap config * : backend = rid" /etc/samba/smb.conf; then
      sed -i -e "s/idmap config \* : backend = rid/idmap config ${DOMAIN} : backend = rid/" \
             -e "s/idmap config \* : range = 32768 - 2147483647/idmap config ${DOMAIN} : range = 32768 - 2000000000\n\
 idmap config \* : backend = tdb\n\
 idmap config \* : range = 2000000001 - 2147483647/" /etc/samba/smb.conf
    fi
  fi
  # old unmodified smb.conf had bad quotes around a list value
  sed -i '/name resolve order = /d' /etc/samba/smb.conf
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6009003 ]; then
  if [ -f /var/cache/fvamazon/acd_fs_cache -a \
    -f /var/cache/fvamazon/checkpoint ]; then
    mkdir -p /apps/.cloud-storage/cache/fvamazon
    mv /var/cache/fvamazon/acd_fs_cache /apps/.cloud-storage/cache/fvamazon
    mv /var/cache/fvamazon/checkpoint /apps/.cloud-storage/cache/fvamazon
    rm -rf /var/cache/fvamazon
  fi
  if [ -d /home/.cloud-storage/cache ]; then
    mkdir -p /apps/.cloud-storage/cache
    mv /home/.cloud-storage/cache/* /apps/.cloud-storage/cache
    rm -rf /home/.cloud-storage
  fi
  if ! grep -q '^TIMEMACHINE_PROTOCOL=' /etc/default/services; then
    echo "TIMEMACHINE_PROTOCOL=AFP" >> /etc/default/services;
  fi

  #Bug#24403
  if [ -f /var/log/frontview/amazoncd.log ]; then
    mkdir -p /apps/.cloud-storage/logs/fvamazon
    mv /var/log/frontview/amazoncd.log /apps/.cloud-storage/logs/fvamazon
    if [ -f /var/log/frontview/amazoncd.log.old ]; then
      mv /var/log/frontview/amazoncd.log.old /apps/.cloud-storage/logs/fvamazon
    fi
  fi

  if [ -d /var/log/frontview/cloud-storage ]; then
    mkdir -p /apps/.cloud-storage/logs
    mv /var/log/frontview/cloud-storage/* /apps/.cloud-storage/logs
    rm -rf /var/log/frontview/cloud-storage
  fi

  #Bug#24547
  if systemctl -q is-enabled fvamazon.service; then
    echo "FVAMAZON=1" >> /etc/default/services;
  fi
  if systemctl -q is-enabled azure-ssb.service; then
    echo "AZURESSB=1" >> /etc/default/services;
  fi
  if systemctl -q is-enabled dropbox.service; then
    echo "DROPBOX=1" >> /etc/default/services;
  fi
  if systemctl -q is-enabled google-drive.service; then
    echo "GOOGLEDRIVE=1" >> /etc/default/services;
  fi
  if systemctl -q is-enabled one-drive.service; then
    echo "ONEDRIVE=1" >> /etc/default/services;
  fi
  if systemctl -q is-enabled amazon-s3.service; then
    echo "AMAZONS3=1" >> /etc/default/services;
  fi

  # fix Bug#17972
  if ! grep -q 'SAMBA_NMB' /etc/default/services; then
    sed -i '/SAMBA=/a \SAMBA_NMB=1' /etc/default/services
  fi

  # Clean up deleted ReadyDR destination shares from 6.9.1
  for S in /*/.purge_*; do
    [ -d "$S" ] || continue
    btrfs prop set "$S" ro false
    [ -d "$S/.snapshots" ] && btrfs subvol del "$S/.snapshots"
    btrfs subvol del "$S"
  done
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6009004 ]; then
  # Anti-Virus schedule scan should be enabled if Anti-Virus is enabled.
  if systemctl -q is-enabled clamav-daemon.service; then
    SERVICE_VALUE=0
    SYS_TYPE=`cat /run/.systype`
    sed -i '/^ANTIVIRUS_SCHE_SCAN=/d' /etc/default/services
    if [ "${SYS_TYPE}" != "RN102" -a "${SYS_TYPE}" != "RN104" ]; then
      SERVICE_VALUE=1
    fi
    echo "ANTIVIRUS_SCHE_SCAN=$SERVICE_VALUE" >> /etc/default/services
  fi

  # readycloud owner's group migration. Change primary group to 97, secondary group to 98
  CLOUD_OWNER=`/opt/replication/bin/rxml /opt/readycloud/etc/registration.conf /registration/owner`
  if [ ! -n "$CLOUD_OWNER" ]; then
    CLOUD_OWNER=`awk -F'[<>]' '/<owner>/ { print $3 }' /opt/readycloud/etc/registration.conf`
  fi
  if [ ${#CLOUD_OWNER} -gt 31 ]; then
    usermod -g ready-cloud ${CLOUD_OWNER:0:31}
    usermod -a -G admin ${CLOUD_OWNER:0:31}
  fi

  # RNAS-7512 Add the ability to selectively ignore log messages. Default value
  # is Info log level which is 1.
   if ! grep -q '^MAIL_SEVERITY_ID=' /etc/default/services; then
    echo "MAIL_SEVERITY_ID=1" >> /etc/default/services;
  fi

  # RNAS-8258 ReadyNAS vault: The vault config file mode is too open
  if [ -e /etc/readyNASVault.config ]; then
    chmod 0640 /etc/readyNASVault.config
  fi
fi

if [ $OLDVER -gt 0 -a $OLDVER -lt 6010000 ]; then
  # fix the broken dependency packages for apache 2.4 upgrade
  apt_wait -c 300 -- -qq update
  err=$(apt_wait -c 600 -- -qq install --fix-broken 2>&1) ||
        echo $err | awk -F\' '/manually run/ { system($2) }'

  if [ -f /etc/frontview/apache/Shares.conf ]; then
    sed -i -e 's/require group/Require unix-group/' \
        -e 's/require user/Require user/' /etc/frontview/apache/Shares.conf
  fi

  if [ -e /etc/apache2/sites-enabled/000-fv-http ]; then
    ln -sf ../sites-available/fv-http-admin.conf /etc/apache2/sites-enabled/000-fv-http.conf
    rm -f /etc/apache2/sites-enabled/000-fv-http
  fi
  # Audit toggle. Default value is 0
  if ! grep -q '^AUDIT=' /etc/default/services; then
    echo "AUDIT=0" >> /etc/default/services;
  fi
  # Hotfix update Default value is 1
  if ! grep -q '^HOTFIXUPDATE=' /etc/default/services; then
    echo "HOTFIXUPDATE=1" >> /etc/default/services;
  fi
  # Firmware update Default value is 1
  if ! grep -q '^MONITOR=.*firmware_update.*' /etc/default/services; then
    sed -i '/^MONITOR=/s/$/,firmware_update/' /etc/default/services
  fi

  # Anti-Virus should be disabled on RN1xx series.
  SYS_TYPE=`cat /run/.systype`
  if [ "${SYS_TYPE}" == "RN102" -o "${SYS_TYPE}" == "RN104" ]; then
    sed -i '/^ANTIVIRUS_SCHE_SCAN=/cANTIVIRUS_SCHE_SCAN=0' /etc/default/services
    sed -i '/^ANTIVIRUS=/cANTIVIRUS=0' /etc/default/services
  fi

  # set spotlight:fts in smb.conf by judging tracker-extract.cfg, spotlight:fts = 0 default
  if [ -f /apps/.xdg/config/tracker/tracker-extract.cfg ]; then
    if ! grep -q "spotlight:fts" /etc/samba/smb.conf; then
      if grep -q "max-bytes=1048576" /apps/.xdg/config/tracker/tracker-extract.cfg ; then
        sed -i '/\[global\]/a\ spotlight:fts = 1' /etc/samba/smb.conf
      fi
    fi
  fi

  # Disable spindown on rack mounts
  if dump_sysflags SYS_FLAG_RACKMOUNT; then
    if [ "${SYS_TYPE}" != "RN2120" -a "${SYS_TYPE}" != "RR2304" -a "${SYS_TYPE}" != "RN3130" \
      -a "${SYS_TYPE}" != "RN2100V2" -a "${SYS_TYPE}" != "RN3100" -a "${SYS_TYPE}" != "RD4100" ]; then
      sed -i '/^NOFLUSHD=/cNOFLUSHD=0' /etc/default/services
    fi
  fi
fi

# RNAS-8996: handle https port 2 conf
if [ $OLDVER -gt 0 -a $OLDVER -lt 6010001 ]; then
  if [ -e /etc/apache2/sites-enabled/001-fv-https2 ]; then
    mv /etc/apache2/sites-enabled/001-fv-https2 /etc/apache2/sites-enabled/001-fv-https2.conf
  fi
fi

# RNAS-9060: default on for readynas feedback from 6.10.2
if [ $OLDVER -gt 0 -a $OLDVER -lt 6010002 ]; then
  if ! grep -q '^READYNAS_FEEDBACK=' /etc/default/services; then
    echo "READYNAS_FEEDBACK=1" >> /etc/default/services;
  fi
fi

#RNAS-9161: re-generate the cert
if [ $OLDVER -gt 0 -a $OLDVER -lt 6010004 ]; then
  rm -f $APACHE_PEM_FILE
  systemctl restart readynas-misc.service
fi

#RNAS-9267  Replicate is still running/backing up, while service is stopped
if [ -e /opt/replication/etc/cron.d/replication ]; then
    rm -f /opt/replication/etc/cron.d/replication
fi
systemctl stop replicate
systemctl disable replicate

# Delete the btrfs qgroup tree if quotas were just disabled
for V in `awk '/LABEL=/ && /btrfs.*,noquota/ { print $2 }' /etc/fstab`; do
  btrfs quota disable $V >/dev/null 2>&1
done
sed -i 's/,noquota//g' /etc/fstab

# Fix world-writable permission from very old firmware
chmod o-w /etc/frontview/proftpd/proftpd.conf.overrides

# Compile glib schemas, to account for user-installed software
if ! /usr/lib/${HOSTTYPE}*/glib-2.0/glib-compile-schemas /usr/share/glib-2.0/schemas; then
  cp /etc/default/config/usr/share/glib-2.0/schemas/gschemas.compiled /usr/share/glib-2.0/schemas/
fi

# Clean up old systemd per-user journal files
rm -rf /var/log/journal/*/user-* 2>/dev/null

# Clean up old APT package archives
apt-get clean

# End
echo "Upgrade success"
systemctl disable readynas-upgrade.service
rm -f $THISFILE

