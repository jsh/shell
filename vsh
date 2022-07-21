#!/bin/bash -eu
# A very simple shell

do_cmd() {
    # do what the user asks
    # this is the 'e' (evaluate) step in "repl"
    eval $*
}

repl() {
    # read-eval-print loop
    PS1="@ "
    while true; do        # infinite loop
        read -p "$PS1" cmd  # put out a "@ " prompt, read what the user types
        do_cmd $cmd
    done
}

repl
