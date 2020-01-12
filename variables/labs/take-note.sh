#!/usr/bin/env bash

set -eoux pipefail

# Ask user for input
read -r note

echo "$note"

# help read

# echo $date: $note >> ~/$topicnotes.txt
# echo $date: $note >> ~/"${topic}"notes.txt
# Why {} ?
