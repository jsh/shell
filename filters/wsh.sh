#/bin/bash
#   pbsh -- the Pybites shell
#
#   A not-very-functional shell, almost pseudocode.
#   Note that setting and dereferencing variables works,
#   and has no effect on the parent shell from which it was forked.

setup() {
        # set prompts to those used by the 1971 Thompson shell
        if [ $(id -u) = 0 ]; then
                PS1='# '  # original root prompt
        else
                PS1='@ '  # default, non-root prompt
        fi
}
repl() {
    # read-execute-print loop
    while read -p "$PS1" line
    do
            process_line "$line"
    done
}
process_line() {
        eval "$*"  # analogous to calls to "execve()" in bash, zsh, et al.
}
shutdown() {
        echo "logging out" # executed on ^D
}

setup
repl
shutdown
