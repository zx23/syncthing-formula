#!/bin/sh

if [ $(which apt-get) ];
then
    sudo apt-get update
    PKG_MANAGER="apt-get"
    PKGS="python-dev git"
else
    PKG_MANAGER="yum"
    PKGS="python-devel git"
fi

sudo $PKG_MANAGER -y install $PKGS

if [ $(which pip) ];
then
    echo ''
else
    curl -L "https://bootstrap.pypa.io/get-pip.py" > get_pip.py
    sudo python get_pip.py
    rm get_pip.py
    sudo pip install gitpython
fi
