#!/usr/bin/env bash
if [ -f './pid' ]; then
    PID=$(cat ./pid) && kill -15 $PID
fi

if [[$? -eq 0]];
then
        echo "Success stoping the app"
else:
        echo "Fail Not staoped"
fi