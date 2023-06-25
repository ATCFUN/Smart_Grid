#!/bin/bash -e
PACKAGES="rn-dictionary freeapp-collection ca-certificates"
export DEBIAN_FRONTEND=noninteractive
ENABLE_HOTFIX=0

if ! grep -q '^HOTFIXUPDATE=0' /etc/default/services; then
  ENABLE_HOTFIX=1
  PACKAGES=$PACKAGES" readynasos"
  OLD_VERSION=`dpkg-query -W -f='${Version}' readynasos`
fi

apt_wait -s -t 36000 -c 7200 -- -qq update || true
err=$(apt_wait -s -c 3600 -- -qq install --fix-broken 2>&1) ||
        echo $err | awk -F\' '/manually run/ { system($2) }'
apt_wait -s -c 36000 -- -qq install -fy $PACKAGES

if [ $ENABLE_HOTFIX -eq 1 ]; then
  NEW_VERSION=`dpkg-query -W -f '${Version}' readynasos`
  if [[ "$NEW_VERSION" == *"+"* ]] && [[ "$NEW_VERSION" != "$OLD_VERSION" ]]; then
    VERSION=`echo "$NEW_VERSION" | awk -F+ '{print $1}'`
    HOTFIX_VERSION=`echo "$NEW_VERSION" | awk -F+ '{print $2}'`
    if [ ! -z "$HOTFIX_VERSION" ]; then
      rnutil event_push shell readynasd "<xs:add-s resource-type=\"Log\" resource-id=\"Log\"> \
        <Log severity=\"notice\" message-tag=\"LOGMSG_HOTFIX_APPLIED\" category=\"system\"> \
        <args OSVersion=\"$VERSION\" HotfixVersion=\"$HOTFIX_VERSION\"/></Log></xs:add-s>" 0 0
    fi
  fi
fi
