#/bin/bash -eu
# a not-very-functional shell
# almost pseudocode

evaluate_and_print() {
	echo "Do whatever '$*' means."
}
while read -p "& " line
do
	evaluate_and_print "$line"
done
