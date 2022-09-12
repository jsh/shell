#!/bin/bash -eu
# refactor count-lines.sh into functions

setup() {
	counter=0 # no lines to start
}
process_line() {
	((counter += 1))
}
shutdown() {
	echo $counter
}

setup
while read line
do
	process_line
done
shutdown
