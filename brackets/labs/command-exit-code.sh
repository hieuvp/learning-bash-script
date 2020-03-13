#!/usr/bin/env bash

set -eou pipefail

if [[ $(grep -q PATTERN FILE)$? ]]; then
  echo "Dat pattern was totally in dat file!"
else
  echo "NOPE."
fi

# since the above works even if
# there is a space between the `$( stuff )` and the `$?`.
# But a neat tip, nonetheless.

# However, in Bash, if statements will process the then branch
# if the expression after if has an exit code of 0 and the else branch otherwise,
# so, in this case,
# we can drop all the fancy stuff and simplify to:

if grep -q PATTERN FILE; then
  echo "Vee haf found eet!"
else
  echo "No.  Lame."
fi
