#!/bin/sh

if [ $(which apt-get) ];
then
    apt-get update
    PKG_MANAGER="apt-get -y install"
    PKGS="python-dev git"
elif [ $(which yum) ];
then
    PKG_MANAGER="yum -y install"
    PKGS="python-devel git"
elif [ $(which pkg) ];
then
    PKG_MANAGER="pkg install -y"
    PKGS="python git curl py27-pip"
else
    echo "Unknown package manger"
    exit 1
fi

$PKG_MANAGER $PKGS

if [ $(which pip) ];
then
    echo ''
else
    curl -L "https://bootstrap.pypa.io/get-pip.py" > get_pip.py
    python get_pip.py
    rm get_pip.py
    pip install gitpython
fi
