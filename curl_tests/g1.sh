#!/bin/sh

# Test getting an item
URL=`cat url`
echo $URL
ID=5

curl -X PATCH -H "Content-Type:application/json" -H 'Accept: application/json' --data-binary '{"data":{"ID":"5"}}' ${URL}/items/$ID


