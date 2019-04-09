#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

set -x

echo "Install some common tools for further installation"
yum -y install epel-release 
yum -y update
yum -y install vim sudo wget which net-tools bzip2 \
    numpy #used for websockify/novnc

### Install sublime text editor
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
yum install -y sublime-text

yum clean all
