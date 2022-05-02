ps aux | grep [f]ilebrowser | awk '{print $2}' | xargs -i kill {} > /dev/null
lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
eips 30 1 "                     "
eips 30 3 "                              "