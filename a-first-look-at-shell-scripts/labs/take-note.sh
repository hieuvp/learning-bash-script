#!/usr/bin/env bash

declare -r directory="/tmp/learning-bash-script/a-first-look-at-shell-scripts"
declare -r file="$directory/notes.txt"

mkdir -p $directory

# $1?
# $@?
# $*: hold all arguments?
# https://coderwall.com/p/85jnpq/bash-built-in-variables
# https://unix.stackexchange.com/questions/41571/what-is-the-difference-between-and
# https://eklitzke.org/bash-$%2A-and-$@
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Special-Parameters
# https://unix.stackexchange.com/questions/129072/whats-the-difference-between-and/129077

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html
# --> 3.2.5. Special parameters

# Command substitution
# $(date)

# ">" vs ">>"?

# echo $(date): $* >> /tmp/learning-bash-script/notes.txt
# echo Note saved: $*

echo "$1" >> $file
echo "Note saved"

cat $file
