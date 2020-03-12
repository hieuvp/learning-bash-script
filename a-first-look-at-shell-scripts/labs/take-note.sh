#!/usr/bin/env bash

declare -r directory="/tmp/learning-bash-script/a-first-look-at-shell-scripts"
declare -r file="$directory/notes.txt"

mkdir -p $directory

# Command substitution
# $(date)

# ">" vs ">>"?
# Called "Redirection"?

# echo $(date): $* >> /tmp/learning-bash-script/notes.txt
# echo Note saved: $*

echo "$1" >> $file
echo "Note saved"

cat $file
