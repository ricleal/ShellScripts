#!/bin/bash

# Test script to connect to fermi using curl

URL="https://fermi.ornl.gov"

if [ -z "${USER}" ];
then 
  echo "Username:"
  read USER
fi

echo "Password for ${USER}"
read -s PASSWORD

USERANDPASS=$(echo "b\"${USER}:${PASSWORD}\"" | base64)

curl --header "Authorization: Basic ${USERANDPASS}" ${URL}



