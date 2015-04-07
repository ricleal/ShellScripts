#!/bin/bash

# Test script to connect to icat using curl
#
# Get tidy for pretty print: sudo apt-get install tidy
# Append at the end of the script calling: | tidy -xml -iq -

INSTRUMENT="EQSANS"
EXPERIMENT="IPTS-13502"
ICAT_DOMAIN='icat.sns.gov'
ICAT_PORT=2080
URL="http://${ICAT_DOMAIN}:${ICAT_PORT}/icat-rest-ws/experiment/SNS/${INSTRUMENT}/${EXPERIMENT}/all"



# Get all Runs info
COMMAND="curl -s ${URL}"
echo $COMMAND