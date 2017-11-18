#!/bin/bash

NETWORK_MANAGER_CONFIG_DIRECTORY=/etc/NetworkManager/system-connections
USERNAME=ricleal@gmail.com
#PASSWORD=<pass here>
echo -n Password: 
read -s PASSWORD

cd /tmp
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip

# 2 directies:
# ovpn_tcp/ ovpn_udp/

# import the files in NETWORK_MANAGER_CONFIG_DIRECTORY
for file in `ls ovpn_tcp/ ovpn_udp/`
do
    echo sudo nmcli connection import type openvpn $file 
done

# Edit the imported files
for file in `ls ${NETWORK_MANAGER_CONFIG_DIRECTORY}/*.nordvpn.*`
do
    echo  $file
    # Append after
    sed -i '/mssfix=yes/a username=${USERNAME}' $file
    sed -i 's/password-flags=1/password-flags=0/g' $file
    echo "[vpn-secrets]" >> $file
    echo "password=${PASSWORD}" >> $file
done