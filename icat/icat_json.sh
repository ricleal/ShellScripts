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
# About instrument, proposals:
#

## Instruments
CMD="${CURL_CMD}/experiment/SNS | python -m json.tool"
eval $CMD
# {
#     "instrument": [
#         "ARCS",
#         "BSS",
#         "CNCS",
#         "CORELLI",
#         "EQSANS",
#         "FNPB",
#         "HYS",
#         "HYSA",
#         "MANDI",
#         "NOM",
#         "NSE",
#         "PG3",
#         "REF_L",
#         "REF_M",
#         "SEQ",
#         "SNAP",
#         "TOPAZ",
#         "USANS",
#         "VIS",
#         "VULCAN"
#     ]
# }

## Get ipts numbers
CMD="${CURL_CMD}/experiment/SNS/MANDI | python -m json.tool"
eval $CMD
# {
#     "proposal": [
#         "2012_2_11b_SCI",
#         "2013_2_11B_SCI",
#         "2014_1_11B_SCI",
#         "IPTS-10136",
#         "IPTS-10138",
#         "IPTS-10663",
#         "IPTS-10943",
#         "IPTS-11063",
#         "IPTS-11091",
#         "IPTS-11215",
#         "IPTS-11464",
#         "IPTS-11482",
#         "IPTS-11543",
#         "IPTS-11817",
#         "IPTS-11862",
#         "IPTS-11932",
#         "IPTS-11940",
#         "IPTS-12152",
#         "IPTS-12402",
#         "IPTS-12438",
#         "IPTS-12697",
#         "IPTS-12864",
#         "IPTS-12874",
#         "IPTS-12924",
#         "IPTS-13243",
#         "IPTS-13288",
#         "IPTS-13552",
#         "IPTS-13643",
#         "IPTS-13653",
#         "IPTS-13722",
#         "IPTS-13904",
#         "IPTS-14069",
#         "IPTS-14562",
#         "IPTS-14586",
#         "IPTS-15880",
#         "IPTS-8776"
#     ]
# }

## Get ipts numbers
CMD="${CURL_CMD}/experiment/SNS/MANDI/meta | python -m json.tool"
eval $CMD
# {
#     "proposal": [
#         {
#             "@id": "2012_2_11b_SCI",
#             "collection": "1",
#             "createTime": "2012-12-06T14:27:32.484-05:00",
#             "title": "TEST"
#         },
#         {
#             "@id": "2013_2_11B_SCI",
#             "createTime": "2013-08-22T17:17:03.433-04:00",
#             "title": "test timezone fix"
#         },
#         (....................)
#         {
#             "@id": "IPTS-13643",
#             "collection": "0",
#             "createTime": "2015-10-20T02:26:21.932-04:00",
#             "title": "Lactamase-1. 4417"
#         }
#     ]
# }


## Get run ranges for an ipts
CMD="${CURL_CMD}/experiment/SNS/MANDI/IPTS-8776 | python -m json.tool"
eval $CMD
# {
#     "runRange": "990-1002, 1005-1006, 1008-1025, 1027-1040, 1091-1155, 1157-3859, 3894-3901, 4339-4354, 4356-4381, 4389-4391"
# }

## Get run ranges for an ipts
CMD="${CURL_CMD}/experiment/SNS/MANDI/IPTS-8776/meta | python -m json.tool"
eval $CMD
# {
#     "proposal": {
#         "@id": "IPTS-8776",
#         "collection": "0",
#         "createTime": "2014-08-22T17:27:17.588-04:00",
#         "runRange": "990-1002, 1005-1006, 1008-1025, 1027-1040, 1091-1155, 1157-3859, 3894-3901, 4339-4354, 4356-4381, 4389-4391",
#         "title": "Test Run-73. 1857"
#     }
# }

## Get run ranges for an ipts
CMD="${CURL_CMD}/experiment/SNS/MANDI/IPTS-8776/all | python -m json.tool"
eval $CMD
# {
#     "proposal": {
#         "@id": "IPTS-8776",
#         "collection": "0",
#         "createTime": "2014-08-22T17:27:17.588-04:00",
#         "runs": {
#             "run": [
#                 {
#                     "@id": "990",
#                     "endTime": "2014-08-22T17:19:59.871-04:00",
#                     "startTime": "2014-08-22T17:18:39.006-04:00",
#                     "title": "NONE"
#                 },
# (...........)
#                 {
#                     "@id": "4391",
#                     "duration": "223236.5819",
#                     "endTime": "2015-09-08T13:35:18.893-04:00",
#                     "protonCharge": "6.84758572238e+13",
#                     "startTime": "2015-09-05T23:34:42.311-04:00",
#                     "title": "beta lactamase 3",
#                     "totalCounts": "1.60876604E8"
#                 }
#             ]
#         },
#         "title": "Test Run-73. 1857"
#     }
# }

#
# About runs:
#

# Get run info
CMD="${CURL_CMD}/dataset/SNS/TOPAZ/12098 | python -m json.tool"
eval $CMD
# {
#     "complete": "false",
#     "duration": "258.5624",
#     "endTime": "2015-08-13T11:48:13.792-04:00",
#     "locations": {
#         "location": [
#             "/SNS/TOPAZ/IPTS-9918/shared/autoreduce/reduction_log/TOPAZ_12098_event.nxs.log",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/NeXus/TOPAZ_12098_histo.nxs",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_runinfo.xml",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/TOPAZ_12098.meta.xml",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_bmon2_histo.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_bmon1_histo.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_pulseid.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_neutron_event.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_cvinfo.xml",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/NeXus/TOPAZ_12098_event.nxs"
#         ]
#     },
#     "proposal": "IPTS-9918",
#     "protonCharge": "291350593900.0",
#     "startTime": "2015-08-13T11:43:55.230-04:00",
#     "title": "-point#01/6",
#     "totalCounts": "805562.0"
# }


# Get run info
CMD="${CURL_CMD}/dataset/SNS/TOPAZ/12098/metaOnly | python -m json.tool"
eval $CMD
# {
#     "complete": "false",
#     "duration": "258.5624",
#     "endTime": "2015-08-13T11:48:13.792-04:00",
#     "proposal": "IPTS-9918",
#     "protonCharge": "291350593900.0",
#     "startTime": "2015-08-13T11:43:55.230-04:00",
#     "title": "-point#01/6",
#     "totalCounts": "805562.0"
# }

# Get run info
CMD="${CURL_CMD}/dataset/SNS/TOPAZ/12098/lite | python -m json.tool"
eval $CMD
# {
#     "complete": "false",
#     "duration": "258.5624",
#     "endTime": "2015-08-13T11:48:13.792-04:00",
#     "locations": {
#         "location": [
#             "/SNS/TOPAZ/IPTS-9918/0/12098/TOPAZ_12098.meta.xml",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_bmon1_histo.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_bmon2_histo.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_cvinfo.xml",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/NeXus/TOPAZ_12098_event.nxs",
#             "/SNS/TOPAZ/IPTS-9918/shared/autoreduce/reduction_log/TOPAZ_12098_event.nxs.log",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/NeXus/TOPAZ_12098_histo.nxs",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_neutron_event.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_pulseid.dat",
#             "/SNS/TOPAZ/IPTS-9918/0/12098/preNeXus/TOPAZ_12098_runinfo.xml"
#         ]
#     },
#     "proposal": "IPTS-9918",
#     "protonCharge": "291350593900.0",
#     "startTime": "2015-08-13T11:43:55.230-04:00",
#     "title": "-point#01/6",
#     "totalCounts": "805562.0"
# }


#
# Last run, data location:
#

CMD="${CURL_CMD}/datafile/SNS/TOPAZ | python -m json.tool"
eval $CMD
# {
#     "number": "13775"
# }

CMD="${CURL_CMD}/datafile/SNS/TOPAZ/13775 | python -m json.tool"
eval $CMD
# {
#     "location": [
#         "/SNS/TOPAZ/IPTS-14791/0/13775/TOPAZ_13775.meta.xml",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_bmon1_histo.dat",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_bmon2_histo.dat",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_cvinfo.xml",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/NeXus/TOPAZ_13775_event.nxs",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/NeXus/TOPAZ_13775_histo.nxs",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_neutron_event.dat",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_pulseid.dat",
#         "/SNS/TOPAZ/IPTS-14791/0/13775/preNeXus/TOPAZ_13775_runinfo.xml"
#     ]
# }
