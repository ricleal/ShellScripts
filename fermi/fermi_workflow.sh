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

# authentication
curl -k \
-b $COOKIE_PATH -c $COOKIE_PATH \
--header "Authorization: Basic ${USERANDPASS}" \
"${URL}/MantidRemote/authenticate"


# info
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
"${URL}/MantidRemote/info" \
| python -mjson.tool

# start transaction and get transaction id stored in $TRANSID

TRANSID=$(\
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
-X GET \
"${URL}/MantidRemote/transaction?Action=Start" \
| python json_extract_value.py TransID )


# Get info about a transaction:"
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
-X GET \
"${URL}/MantidRemote/files?TransID=${TRANSID}" \
| python -mjson.tool


# Stop transaction
# If no output is returned it succeed, othwerwise:
# { "Err_Msg": "Transaction '514' does not exist" }
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
-X GET \
"${URL}/MantidRemote/transaction?Action=Stop&TransID=515" \
