#!/bin/sh

if [ "$(ls /vagrant)" ]
then
    SRCDIR=/vagrant
else
    SRCDIR=/home/vagrant/sync
fi
mkdir -p /srv/salt
mkdir -p /srv/pillar
mkdir -p /srv/formulas
cp $SRCDIR/pillar.example /srv/pillar/pillar.sls
cp -r $SRCDIR/syncthing /srv/salt
echo "\
base:
  '*':
    - pillar" | tee /srv/pillar/top.sls
cp $SRCDIR/salt-top.example /srv/salt/top.sls
