#!/bin/sh

PORT_NUMBER=`cat local/PORT_NUMBER`
bundle exec rails s -b 0.0.0.0 -p $PORT_NUMBER > rails.log 2>rails.err &

