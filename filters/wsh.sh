#/bin/bash -eu
# a not-very-functional shell
# almost pseudocode

setup() {
	PS1='& '
}
process_line() {
	eval "$*"
}
shutdown() {
	echo "logging out"
}

setup
while read -p "$PS1" line
do
	process_line "$line"
done
shutdown
