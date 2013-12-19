#!/bin/sh


IP=`ip addr list eth0 |grep "inet " |cut -d' ' -f6|cut -d/ -f1`

/opt/torquebox/current/jboss/bin/standalone.sh -Djboss.bind.address=$IP