#!/bin/bash
#   pbsh -- the Pybites shell
#
#   A not-very-functional shell, almost pseudocode.
#   Note that setting and dereferencing variables works,
#   and has no effect on the parent shell from which it was forked.

read_rc_settings() {	# rc stands for "run commands"
    RCFILE=~/.pbshrc
	[ -e $RCFILE ] &&    # if .pbshrc exists
        source $RCFILE   #   evaluate all statements in it 
}
set_built_in_defaults() {
	PS1='@ '
}
repl() {
    # read-execute-print loop
    while read -p "$PS1" line
    do
        eval "$line"  # analogous to calls to "execve()" in bash, zsh, et al.
    done
}
set_built_in_defaults
read_rc_settings
[ $(id -u) = 0 ] && PS1='# '   # shortcut if…then
repl
