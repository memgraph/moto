#!/bin/bash
if [ -z $1 ]; then
    echo "Missing instance name"
    exit 1
fi

vboxmanage startvm $1 --type headless > /dev/null 2>&1
