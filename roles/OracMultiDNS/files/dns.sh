#!/bin/bash

if [ X$1 = X ]
then
    echo PARAM missing name of config file
    exit 1
fi

if [ -f $1 ]
then
	. $1
else
	echo PARAM file $1 does not exist
	exit 1
fi

extInterface="--except-interface=lo"
if [ $interface = eth0 ]
then
extInterface=""
fi

dnsmasq  --interface=$interface ${extInterface} --bind-interfaces \
--no-hosts --hostsdir=/opt/oracMultiDNS/all/  --hostsdir=$hostsdir --expand-hosts \
--domain=$domain --domain-needed --server=$server --no-resolv \
--pid-file=$pidfile --user=$user --cache-size=2000