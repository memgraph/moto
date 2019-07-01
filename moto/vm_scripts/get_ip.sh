#!/bin/bash

if [ -z $1 ]; then
    echo "Instance name missing"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
out=$(bash $DIR/instance_bash.sh $1 "ip -4 addr show eth0 | grep inet | sed -E 's/.*inet (.*)\/.*/\1/'" 2> /dev/null)
# In case instance is not running or network interface in not running or output is empty
if [ $? != 0 ] || [ -z $out ]; then
    exit 1
fi

echo $out
