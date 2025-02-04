#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

(IFS='
'

for instance in $(vboxmanage list vms); do
    name=$(echo $instance | sed -E 's/"(.+)".*/\1/')

    if [[ $name == instance_* ]]; then
        $($DIR/stop_instance.sh $name)
        $($DIR/delete_instance.sh $name)
    fi

done)
