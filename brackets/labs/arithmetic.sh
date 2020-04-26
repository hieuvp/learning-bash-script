#!/usr/bin/env bash

set -eou pipefail

i=4
((i += 3))
echo $i
# => 7

((4 + 8))
# => No Output
echo $? # Check the exit code of the last command
# => 0

# ((5 - 5))
# echo $?
# => 1

# Strings inside get considered 'zero'.
#((i += POO))
#echo $i
# => 7

# You can't use it in an expression
# a=(( 4 + 1 ))
# => bash: syntax error near unexpected token '('
