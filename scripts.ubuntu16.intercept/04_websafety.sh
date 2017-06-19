#!/bin/bash

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# default arc
MAJOR="5.1.0"
MINOR="719B"
ARCH="amd64"

# download
wget http://packages.diladele.com/websafety/$MAJOR.$MINOR/$ARCH/release/ubuntu16/websafety-$MAJOR.${MINOR}_$ARCH.deb

# install
dpkg --install websafety-$MAJOR.${MINOR}_$ARCH.deb

# relabel folder
chown -R websafety:websafety /opt/websafety