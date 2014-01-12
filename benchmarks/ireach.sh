#!/bin/bash

./ireachable -d $1  -i $2  -o p -s 1 -l

rm -f execution.stats
rm -f grounding.stats
rm -f p
