#!/usr/bin/env bash

printf "\n"

# Expands to the name of the shell or shell script
printf "\$0 = %s\n" "$0"
printf "\n"

printf "\$1 = %s\n" "$1"
printf "\$2 = %s\n" "$2"
printf "\$3 = %s\n" "$3"
printf "\n"

# Expands to the positional parameters, starting from one
# When the expansion occurs within double quotes,
# each parameter expands to a separate word.
printf "\$@ = %s\n" "$@"
printf "\n"

# Expands to the positional parameters, starting from one
# When the expansion occurs within double quotes,
# it expands to a single word with the value of each parameter
# separated by the first character of the IFS special variable
printf "\$* = %s\n" "$*"
printf "\n"

# Expands to the number of positional parameters in decimal
printf "\$# = %s\n" "$#"
printf "\n"
