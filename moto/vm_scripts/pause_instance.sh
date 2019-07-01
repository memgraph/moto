#!/bin/bash
if [ -z $1 ]; then
    echo "Missing instance name"
    exit 1
fi

vboxmanage controlvm $1 pause > /dev/null 2>&1
