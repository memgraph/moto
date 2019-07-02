#!/bin/bash

if [ -z $1 ]; then
    echo "Missing instance name"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while : ; do
    out=$(bash $DIR/get_ip.sh $1)
    status=$?
    [ $status != 0 ] || break
    sleep 0.5
done
