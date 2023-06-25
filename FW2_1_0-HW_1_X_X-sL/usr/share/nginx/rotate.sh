#!/bin/sh

# nginx -s reload
logfile=/var/log/nginx/error.log
size=$(du "$logfile" | cut -f 1)
[ "$size" -gt 64 ] && {
  mv -f $logfile $logfile.old
  nginx -s reopen
}
