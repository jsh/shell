#!/bin/bash
# do something based on lines
# this is a very simple 'wc -l'

counter=0                # no lines to start
while read line
do
	((counter += 1)) # bump the counter
done
echo $counter            # report number of lines read

