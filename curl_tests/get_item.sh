#!/bin/sh

# Test getting an item
URL=`cat url`
echo $URL
ID=3

curl -X PATCH -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary '{"data":{"ID":"5"}}' ${URL}/items/$ID.json


