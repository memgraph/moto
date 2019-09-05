#!/bin/bash

if [[ -z $1 ]]; then
    echo "Missing instance name"
    exit 1
fi

if [[ -z ${2} ]]; then
    echo "Bash command missing"
    exit 1
fi

vboxmanage guestcontrol $1 run \
    --exe "/bin/bash" \
    --username admin \
    --password password \
     -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin \
    -- bash/arg0 -c "$2"
