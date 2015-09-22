#!/bin/bash

log=/var/log/seafile.log

function stop_server() {
    kill $( ps ax | grep -E 'seafile-controller|ccnet-server|seaf-server' | grep -v grep | awk '{ print $1 }' | xargs )
    exit 0
}

trap stop_server SIGINT SIGTERM

/opt/seafile/seafile-server-latest/seafile.sh start >> $log 2>&1

# Script should not exit unless seafile died
while pgrep -f "seafile-controller" 2>&1 >/dev/null; do
    sleep 5;
done

exit 0