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
    --username ec2-user \
    --password password \
    -E PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin \
    -- bash/arg0 -c "$2"
