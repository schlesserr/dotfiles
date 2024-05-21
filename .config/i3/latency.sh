#!/bin/bash

i3status | while :
do
    read line
    echo "ping: $(ping -qc1 google.com 2>&1 | awk -F'/' 'END{ print (/^rtt/? ""int($5)"ms":"FAIL") }') | $line" || exit 1
done
