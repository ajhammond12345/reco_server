#!/bin/sh

# Test getting all items
URL=`cat url`
# echo $URL
# ID=5
# Output is so big that we store in an output file
FILTER_LIST_JSON=f1.json
OUT_FILE=of1_out.json

curl -X POST -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary @$FILTER_LIST_JSON ${URL}/items/filtered_list.json > $OUT_FILE
echo "Results are in ${OUT_FILE}."

FILTER_LIST_JSON=f2.json
OUT_FILE=of2_out.json
curl -X POST -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary @$FILTER_LIST_JSON ${URL}/items/filtered_list.json > $OUT_FILE
echo "Results are in ${OUT_FILE}."


# 3
FILTER_LIST_JSON=f3.json
OUT_FILE=of3_out.json
curl -X POST -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary @$FILTER_LIST_JSON ${URL}/items/filtered_list.json > $OUT_FILE
echo "Results are in ${OUT_FILE}."


# 4
FILTER_LIST_JSON=f4.json
OUT_FILE=of4_out.json
curl -X POST -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary @$FILTER_LIST_JSON ${URL}/items/filtered_list.json > $OUT_FILE
echo "Results are in ${OUT_FILE}."



