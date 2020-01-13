#!/usr/bin/env bash

declare -r directory="/tmp/learning-bash-script/a-first-look-at-shell-scripts"
declare -r file="$directory/notes.txt"

mkdir -p $directory

# $1?
# $@?
# $*: hold all arguments?

# Command substitution
# $(date)

# ">" vs ">>"?

#echo $(date): $* >> /tmp/learning-bash-script/notes.txt
#echo Note saved: $*

echo "$1" >> $file

cat $file
