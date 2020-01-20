#!/usr/bin/env bash

set -eoux pipefail

# Get the date
# date=$(date)

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

##!/bin/bash
#
## Simple note-taking script
## Author: reindert
#
## get the date
#date=$(date)
#
## get the topic
#topic="$1"
#
## filename to write to
#filename="${HOME}/${topic}notes.txt"
#
## Ask user for input
#read -p "Your note: " note
#
#echo "$date: $note" >> "$filename"
#echo "Note '$note' saved to $filename"
