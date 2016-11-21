#!/bin/sh

if [ -z $(which pip) ]
then
    salt-call --local pkg.install python-pip
fi
if [ -z $(which testinfra) ]
then
    pip install testinfra
fi
if [ "$(ls /vagrant)" ]
then
    SRCDIR=/vagrant
else
    SRCDIR=/home/vagrant/sync
fi
rm -rf $SRCDIR/tests/__pycache__
testinfra $SRCDIR/tests
