#!/usr/bin/env bash
#exec >>/root/bootstrap.out 2>&1
#set -x
env
DIR=/root
echo "DIR: $DIR"
apt-get update --fix-missing
#apt-get upgrade -y
apt-get install -q -y openjdk-7-jdk wget unzip

wget --output-document=$DIR/fortressBuilder-Debian-Silver-x86-64-1.0-RC27.zip "http://iamfortress.org/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://iamfortress.org/sites/default/files/fortressBuilder-Debian-Silver-x86-64-1.0-RC27.zip&nid=99"
unzip $DIR/fortressBuilder-Debian-Silver-x86-64-1.0-RC27.zip -d /opt/fortress
echo "FORTRESS_HOME=/opt/fortress" >> $DIR/.profile
rm $DIR/fortressBuilder-Debian-Silver-x86-64-1.0-RC27.zip
source $DIR/.profile
cd $FORTRESS_HOME
chmod a+x -Rf *
cp /vagrant/build.properties $FORTRESS_HOME/build.properties
echo "sudo.pw=password" >> $FORTRESS_HOME/build.properties
cp /vagrant/b.sh $FORTRESS_HOME/b.sh
./b.sh dist