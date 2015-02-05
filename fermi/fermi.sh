#!/bin/bash

# Test script to connect to fermi using curl

URL="https://fermi.ornl.gov"
COOKIE_PATH=./cookies.txt

if [ -z "${USER}" ];
then 
  echo "Username:"
  read USER
fi

echo "Password for ${USER}"
read -s PASSWORD


USERANDPASS=$(printf "${USER}:${PASSWORD}" | base64 )

# authentication
curl -k \
-b $COOKIE_PATH -c $COOKIE_PATH \
--header "Authorization: Basic ${USERANDPASS}" \
"${URL}/MantidRemote/authenticate"

echo "**** info:"
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
"${URL}/MantidRemote/info" \
| python -mjson.tool

echo "**** start transaction:"
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
-X GET \
"${URL}/MantidRemote/transaction?Action=Start" \
| python -mjson.tool
