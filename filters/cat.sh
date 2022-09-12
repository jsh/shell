#!/bin/bash -eu
# pass every line from input to output, unchanged
# "The unexamined life is not worth living." -- Socrates

while read line        # read a line at a time
do
	echo "$line"  # print it
done
