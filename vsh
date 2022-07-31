#!/bin/bash

__setup__() {
    PS1="& "                  # set the prompt
}
__read__() {
    read -p "$PS1" line ||    # prompt, put contents of input line into $line
        exit 0                # quit on EOF
}
__evaluate__() {
    eval $*                   # do it
}
__print__() {
    [ -n "$*" ] && echo $*    # print unless empty
}

__setup__

# the REPL
while true; do
    __read__
    out=$(__evaluate__ "$line")
    __print__ $out
done
