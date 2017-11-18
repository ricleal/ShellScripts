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

cd /tmp/ovpn_tcp/
for file in `ls *.ovpn`
do
    sudo nmcli connection import type openvpn file $file 
done

cd /tmp/ovpn_udp/
for file in `ls *.ovpn`
do
    sudo nmcli connection import type openvpn file $file 
done

# Edit the imported files
for file in `ls ${NETWORK_MANAGER_CONFIG_DIRECTORY}/*.nordvpn.*`
do
    echo  $file
    # Append after
    sudo sed -i '/mssfix=yes/a username=${USERNAME}' $file
    sudo sed -i 's/password-flags=1/password-flags=0/g' $file
    echo "" | sudo tee --append $file
    echo "[vpn-secrets]" | sudo tee --append $file
    echo "password=${PASSWORD}" | sudo tee --append $file
    echo "" | sudo tee --append $file
done
