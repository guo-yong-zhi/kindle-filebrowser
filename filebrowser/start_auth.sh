#!/bin/sh
lipc-set-prop -i com.lab126.powerd preventScreenSaver 1
lipc-wait-event  com.lab126.hal powerButtonPressed| if read event; then
    lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
    killall filebrowser
    eips 25 2 "File Browser is turned off. "
fi > /dev/null &

iptables -I INPUT -p tcp --dport 80 -j ACCEPT
eips 25 1 "IP: `ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'`"

if [ "$(ps aux | grep '[f]ilebrowser')" ];then killall filebrowser;fi

if [ -f ./filebrowser.db ]
then
    METHOD=$(./filebrowser config cat | grep 'Auth method' | awk '{print $3}')
    if [ 'json' != "$METHOD" ]
    then
        ./filebrowser config set --auth.method=json > /dev/null
    fi
fi
./filebrowser -a 0.0.0.0 -p 80 -r /mnt/us > /dev/null
