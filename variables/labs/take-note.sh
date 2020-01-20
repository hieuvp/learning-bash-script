#!/usr/bin/env bash

set -eoux pipefail

# Ask user for input
# read -r note

# -p prompt
read -r -p "Your note: " note

echo "$note"

# help read

# echo $date: $note >> ~/$topicnotes.txt
# echo $date: $note >> ~/"${topic}"notes.txt
# Why {} ?

echo Note saved: "$note"

cat notes.txt
