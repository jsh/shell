#!/bin/bash
#   shsh -- A shell written as a shell script
#
#   A not-very-functional shell, almost pseudocode.
#   Observe that setting and dereferencing variables works,
#   and has no effect on the parent shell from which it was forked.

set_built_in_defaults() {
    # In bash, everything's in global scope by default.
    # Globals are not exported to child processes.

    # shell variables
	PS1='@ '                            # default prompt, from Thompson shell

    # builtin commands
    hello() { echo "hello, jeff!"; }    # if this works, you're running this shell
    source()                            # builtin version! overrides bash builtin
    {
        local line                      # do not use global value
        while read line; do
            eval $line;
        done < $1                       # first func argument, the file to source
    }
}
read_rc_settings() {                    # rc stands for "run commands"
    local RCFILE=~/.shshrc              # the config file
	[ -e $RCFILE ] &&                   # if config exists
        source $RCFILE                  #   evaluate all statements in it 
}
repl() {
	local line
    # read-execute-print loop
    while read -p "$PS1" line; do       # PS1 is the user's prompt
        eval "$line"                    # like calls to "execve()" in bash, zsh, et al.
    done
}
set_built_in_defaults
read_rc_settings
[ $(id -u) = 0 ] && PS1='# '            # shortcut if…then
if [ $# = 0 ]; then
    repl
else
    cat $1 | repl                       # permit shebang invocation
fi
