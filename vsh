#!/bin/bash -eu
# A very simple shell

while true; do        # infinite loop
    read -p "@ " cmd  # put out a "@ " prompt, read what the user types
    echo $cmd         # print it
done
