#!/usr/bin/env bash

echo "$ cat /dev/non-null"
cat /dev/non-null
printf "\$? = %s\n" "$?"

printf "\n"

echo "$ cat /dev/null"
cat /dev/null
printf "\$? = %s\n" "$?"
