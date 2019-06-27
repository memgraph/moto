#!/bin/bash

# Download base.vdi
# Imange must have Virtualbox guest additions
curl $1 > base.zip
unzip base.zip
rm base.zip

# Create host only network
net=$(vboxmanage hostonlyif create 2> /dev/null  | sed -E "s/.*Interface '(.*)'.*/\1/")
vboxmanage hostonlyif ipconfig $net --ip 10.10.10.1
vboxmanage dhcpserver add --ifname $net --ip 10.10.10.1 --netmask 255.255.255.0 --lowerip 10.10.10.10 --upperip 10.10.10.254
vboxmanage dhcpserver modify --ifname $net --enable

# Create base virtualbox intance
vboxmanage createvm --name base --ostype Linux_64 --register
vboxmanage modifyvm base --memory 512 --vram 16
vboxmanage modifyvm base --graphicscontroller vmsvga
vboxmanage modifyvm base --hostonlyadapter1 $net --nic1 hostonly
vboxmanage storagectl base --name "IDE Controller" --add ide
vboxmanage storageattach base --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium base.vdi
