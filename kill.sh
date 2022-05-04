col=30
eips $col 3 "killing...                    "
lipc-send-event com.lab126.hal powerButtonPressed
sleep 5
ps aux | grep [f]ilebrowser | awk '{print $2}' | xargs -i kill {} > /dev/null
lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
eips $col 1 "                     "
eips $col 3 "                              "