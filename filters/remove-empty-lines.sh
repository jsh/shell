#!/bin/bash -eu
# decide which lines to pass through
# grep is a more sophisticated twist on the same basic theme

while read line
do                             # read a line at a time
	if [ -n "$line" ]      # if the line is not empty
	then
		echo "$line"   # print it.
	fi
done
