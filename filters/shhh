#!/bin/bash
#   shhh -- A shell written as a shell script
#
#   A not-very-functional shell, almost pseudocode.
#   Observe that setting and dereferencing variables works,
#   and has no effect on the parent shell from which it was forked.
#
#   It's pronounced "Shhh!" Don't tell anybody. :-)

config() {
    setup_history
    set_builtin_defaults
}
setup_history() {
    set -o history                      # turn on history
    HISTFILE=~/.shhh_history            # instead of ~/.bash_history
    trap 'history -w' EXIT              # write out history list to $HISTFILE on exit
}
define_builtins() {
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
set_builtin_defaults() {
    # In bash, everything's in global scope by default.
    # Globals are not exported to child processes.

    # shell variables
	PS1='@ '                            # default prompt, from Thompson shell
    set -i                              # mark shell interactive
    set -m                              # monitor mode (enable job control)
}
read_rc_settings() {                    # rc stands for "run commands"
    local RCFILE=~/.shhhrc              # the config file
	[ -e $RCFILE ] &&                   # if config exists
        source $RCFILE                  #   evaluate all statements in it 
}
repl() {
	local line
    # read-execute-print loop
    while read -ep "$PS1" line; do      # PS1 is the user's prompt, -e turns on readline editing
        eval "$line"                    # like "execve()" in bash, zsh, et al.
        history -s -- "$line"           # store line in $HISTFILE
    done
}

config
read_rc_settings
[ $(id -u) = 0 ] && PS1='# '            # shortcut if…then
if [ $# = 0 ]; then
    repl
else
    cat $1 | repl                       # permit shebang invocation
fi
