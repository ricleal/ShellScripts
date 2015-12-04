#!/bin/bash

HOST_PROD="icat.sns.gov"
HOST_DEV="icat-testing.sns.gov"
HOST=$HOST_PROD

PORT=2080

PATH_PREFIX="icat-rest-ws"
URL_PREFIX="http://${HOST}:${PORT}/${PATH_PREFIX}"

CURL_OPTIONS="-s -H \"Accept: application/json\""
CURL_CMD="/usr/bin/curl ${CURL_OPTIONS} ${URL_PREFIX}"

#
CMD="${CURL_CMD}/experiment/SNS | python -m json.tool"
eval $CMD

# Get ipts numbers
CMD="${CURL_CMD}/experiment/SNS/MANDI | python -m json.tool"
eval $CMD

# Get ipts numbers and descriptions
CMD="${CURL_CMD}/experiment/SNS/TOPAZ/meta | python -m json.tool"
eval $CMD

# Get ipts run range
CMD="${CURL_CMD}/experiment/SNS/TOPAZ/IPTS-9918 | python -m json.tool"
eval $CMD

# Get ipts all runs with info (SLOW!)
CMD="${CURL_CMD}/experiment/SNS/TOPAZ/IPTS-9918/all | python -m json.tool"
eval $CMD

# Get ipts all runs with info (lite!)
# Not working :(
CMD="${CURL_CMD}/dataset/SNS/MANDI/IPTS-13722/lite | python -m json.tool"
eval $CMD
