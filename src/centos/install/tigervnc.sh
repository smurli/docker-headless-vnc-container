#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
wget https://dl.bintray.com/tigervnc/stable/tigervnc-el7.repo -O /etc/yum.repos.d/tigervnc.repo
yum -y install tigervnc-server
yum clean all

mkdir -p /headless/.vnc/
tee /headless/.vnc/xstartup << 'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/etc/X11/xinit/xinitrc
#vncserver -kill $DISPLAY
xhost +
EOF

