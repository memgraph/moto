#!/bin/bash
if [ -z $1 ]; then
    echo "Missing instance name"
    exit 1
fi

vboxmanage unregistervm $1 --delete > /dev/null 2>&1
