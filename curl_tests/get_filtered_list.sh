#!/bin/sh

# Test getting all items
URL=`cat url`
# echo $URL
# ID=5
# Output is so big that we store in an output file
OUT_FILE=filtered_list.json

curl -X GET -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great ${URL}/items/filtered_list.json > $OUT_FILE

echo "Results are in ${OUT_FILE}."


