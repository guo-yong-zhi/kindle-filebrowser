#!/bin/sh
col=30
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
# enable wireless if it is currently off
WIFI_IS_OFF=0
if [ 0 -eq `lipc-get-prop com.lab126.cmd wirelessEnable` ]; then
	eips $col 3 "WiFi is off, turning it on now"
	lipc-set-prop com.lab126.cmd wirelessEnable 1
	WIFI_IS_OFF=1
fi

# start filebrowser in the background
if [ "$(ps aux | grep '[f]ilebrowser')" ];then killall filebrowser;fi
"$@" &

# refresh IP display in the background
while :; do
    eips $col 1 "== `ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'` =="
    sleep 5
done > /dev/null &

# waiting for powerButtonPressed
lipc-set-prop -i com.lab126.powerd preventScreenSaver 1
lipc-wait-event  com.lab126.hal powerButtonPressed | read event #it's blocking
lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
kill $(jobs -p)
eips $col 3 "File Browser is turned off.   "

# Restore WiFi status
if [ 1 -eq $WIFI_IS_OFF ]; then
	lipc-set-prop com.lab126.cmd wirelessEnable 0
	sleep 0.5
	eips $col 3 "Turning off WiFi              "
fi

# Clear screen
sleep 1
eips $col 1 "                     "
eips $col 3 "                              "
killall filebrowser
ps aux | grep [f]ilebrowser | awk '{print $2}' | xargs -i kill {} > /dev/null
