#!/usr/bin/env bash

greeting="Good morning"
echo "$greeting, $USER"

user_greeting="$greeting, $USER"
echo "$user_greeting"

# Case sensitive
# echo "$greeting, $user"

# Finding more global variables as USER above
# Pre-defined variables are all UPPERCASE
