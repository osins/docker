#!/bin/sh
if [ $NAME_SERVER ]; then
    sed -i "s/nameserver \d+.\d+.\d+.\d+/nameserver ${NAME_SERVER}/g" /etc/resolv.conf
fi
