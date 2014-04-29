#!/bin/sh

# move to own script to fight the AUF 42 parent max

rm /var/lib/dpkg/info/oracle-java7-installer*
apt-get purge oracle-java7-installer*
rm /etc/apt/sources.list.d/*java*

echo deb http://archive.ubuntu.com/ubuntu raring main universe multiverse > /etc/apt/sources.list
apt-get update && apt-get install -y software-properties-common 
add-apt-repository ppa:webupd8team/java -y 
apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer unzip wget

