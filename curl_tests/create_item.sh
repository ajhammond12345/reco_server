#!/bin/sh

# Test getting an item
URL=`cat url`
echo $URL
ID=5

curl -X PATCH -H "Content-Type:application/json" -H 'Accept: application/json' --basic -u test:great --data-binary '{"data":{"item_description":"testing upload"}}' ${URL}/items/create


