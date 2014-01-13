#!/bin/bash

./ireachable -d $1  -i $2 -o p -s 5 -c

rm -f execution.stats
rm -f grounding.stats
rm -f p
