#!/bin/bash

# Test script to connect to fermi using curl
#
# Help here:
# http://www.mantidproject.org/Remote_Job_Submission_API
#
#
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

# info
curl -k \
-b $COOKIE_PATH -c $COOKIE_PATH \
--header "Authorization: Basic ${USERANDPASS}" \
"${URL}/MantidRemote/Info"

# authentication
curl -v -k \
-b $COOKIE_PATH -c $COOKIE_PATH \
--header "Authorization: Basic ${USERANDPASS}" \
"${URL}/MantidRemote/authenticate"

echo "**** info:"
curl -v -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
"${URL}/MantidRemote/info" \
| python -mjson.tool

# echo "**** start transaction:"
# curl -k -s \
# -b $COOKIE_PATH -c $COOKIE_PATH \
# -X GET \
# "${URL}/MantidRemote/transaction?Action=Start" \
# | python -mjson.tool

# echo "**** Get info about a transaction:"
# curl -k -s \
# -b $COOKIE_PATH -c $COOKIE_PATH \
# -X GET \
# "${URL}/MantidRemote/files?TransID=366" \
# | python -mjson.tool

