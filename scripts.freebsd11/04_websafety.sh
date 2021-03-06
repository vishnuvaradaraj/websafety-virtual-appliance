#!/bin/csh

# setup some configuration variables
ARCH=`uname -m`
DDWS_VERSION=6.0.0
DDWS_BUILD=9A63

# get latest version of web safety
fetch http://packages.diladele.com/websafety/$DDWS_VERSION.$DDWS_BUILD/$ARCH/release/freebsd11/websafety-$DDWS_VERSION-$ARCH.txz

# and install it
env ASSUME_ALWAYS_YES=YES pkg install -y websafety-$DDWS_VERSION-$ARCH.txz

# autostart ICAP server
grep -e '^\s*wsicapd_enable\s*=\s*\"YES\"\s*$' /etc/rc.conf
if [ $? -ne 0 ]; then
	echo "wsicapd_enable=\"YES\"" >> /etc/rc.conf
fi

# autostart monitoring server
grep -e '^\s*wsmgrd_enable\s*=\s*\"YES\"\s*$' /etc/rc.conf
if [ $? -ne 0 ]; then
	echo "wsmgrd_enable=\"YES\"" >> /etc/rc.conf
fi

# autostart sync server
grep -e '^\s*wssyncd_enable\s*=\s*\"YES\"\s*$' /etc/rc.conf
if [ $? -ne 0 ]; then
	echo "wssyncd_enable=\"YES\"" >> /etc/rc.conf
fi
