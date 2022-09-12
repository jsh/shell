#!/usr/bin/env bash -eu
# The shebang line above is probably a bad idea,
# but I'm forced into it by my Mac

# transform each input line

while read line
do
	echo ${line^^}   # convert to upper-case and print
done
