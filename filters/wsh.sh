#/bin/bash
#   pbsh -- the Pybites shell
#
#   A not-very-functional shell, almost pseudocode.
#   Note that setting and dereferencing variables works,
#   and has no effect on the parent shell from which it was forked.

set_prompt() {
        # set prompts to those used by the 1971 Thompson shell
        if test $(id -u) = 0; then PS1='# '; else PS1='@ '; fi
}
repl() {
    # read-execute-print loop
    while read -p "$PS1" line
    do
        eval "$line"  # analogous to calls to "execve()" in bash, zsh, et al.
    done
}
set_prompt
repl
