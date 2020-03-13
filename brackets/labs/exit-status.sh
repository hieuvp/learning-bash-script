#!/usr/bin/env bash

echo "$ cat /dev/non-null"
cat /dev/non-null
printf "\$? = %s\n" "$?"

printf "\n"

echo "$ cat /dev/null"
cat /dev/null
printf "\$? = %s\n" "$?"

##!/usr/bin/env bash
#
#set -eou pipefail
#
#if [[ $(grep -q PATTERN FILE)$? ]]; then
#  echo "Dat pattern was totally in dat file!"
#else
#  echo "NOPE."
#fi
#
## if grep -q PATTERN FILE; then
##   echo "Vee haf found eet!"
## else
##   echo "No.  Lame."
## fi
