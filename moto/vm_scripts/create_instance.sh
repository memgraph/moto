#!/bin/bash
if [ -z $1 ]; then
    echo "Missing instance name"
    exit 1
fi

vboxmanage clonevm --name $1 --register base > /dev/null 2>&1
