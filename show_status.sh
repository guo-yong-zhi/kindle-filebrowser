#!/bin/sh
col=30
test_process=$(ps aux | grep "[f]ilebrowser")
if [ -n "$test_process" ]
then
    result="File Browser is Running.....  "
else
    result="File Browser is not running   "
fi
eips $col 3 "$result"
