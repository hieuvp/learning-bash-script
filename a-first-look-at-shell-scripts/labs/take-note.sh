#!/usr/bin/env bash

mkdir -p "/tmp/learning-bash-script"

# $1?
# $@?
# $*: hold all arguments?

# Command substitution
# $(date)

# > vs >>

#echo $(date): $* >> /tmp/learning-bash-script/notes.txt
#echo Note saved: $*

echo "$1" >> /tmp/learning-bash-script/notes.txt
