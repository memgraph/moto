#!/bin/bash
vboxmanage guestproperty get $1 "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f 2
