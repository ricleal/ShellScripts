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

# echo "**** info:"
# curl -k -s \
# -b $COOKIE_PATH -c $COOKIE_PATH \
# "${URL}/MantidRemote/info" \
# | python -mjson.tool

# echo "**** Get info about a transaction:"
# curl -k -s \
# -b $COOKIE_PATH -c $COOKIE_PATH \
# -X GET \
# "${URL}/MantidRemote/files?TransID=366" \
# | python -mjson.tool


# echo "**** File web_submission.py:"
# curl -k -s \
# -b $COOKIE_PATH -c $COOKIE_PATH \
# -X GET \
# "${URL}/MantidRemote/download?TransID=366&File=web_submission.py" 



echo "**** File 33321.fermi-mgmt3.ornl.gov.ER:"
curl -k -s \
-b $COOKIE_PATH -c $COOKIE_PATH \
-X GET \
"${URL}/MantidRemote/download?TransID=366&File=33321.fermi-mgmt3.ornl.gov.ER"


