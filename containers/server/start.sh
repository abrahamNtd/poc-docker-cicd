#!/usr/bin/env bash
PID=0
if [ -f './pid' ]; then
    PID=$(cat ./pid)
fi

if ps -p $PID > /dev/null
then
   echo "Service with $PID is already running"
else
    nohup java -jar $1 > service.out 2> errors.txt < /dev/null & PID=$!; echo $PID > ./pid
fi