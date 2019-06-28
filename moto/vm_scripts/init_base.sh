#!/bin/bash
# Arg 1 - Url to zipped base image
#   Extracted base image must be named 'base.vdi'
#   Base image must have Virtualbox guest additions
# Arg 2 - Network interface to use for virtualbox instances

# Download base.vdi
curl $1 > base.zip
unzip base.zip
rm base.zip

# Create base virtualbox intance
vboxmanage createvm --name base --ostype Linux_64 --register
vboxmanage modifyvm base --memory 512 --vram 16
vboxmanage modifyvm base --graphicscontroller vmsvga
vboxmanage modifyvm base --nic1 bridged --bridgeadapter1 $2
vboxmanage storagectl base --name "IDE Controller" --add ide
vboxmanage storageattach base --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium base.vdi
