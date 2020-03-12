# Brackets

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`( Single Parentheses )`](#-single-parentheses-)
  - [Subshell](#subshell)
  - [Array](#array)
- [`(( Double Parentheses ))`](#-double-parentheses-)
  - [Arithmetic Expansion](#arithmetic-expansion)
- [`<( Angle Parentheses )`](#-angle-parentheses-)
  - [Process Substitution](#process-substitution)
- [`$( Dollar Single Parentheses )`](#-dollar-single-parentheses-)
  - [Command Substitution](#command-substitution)
- [`$( Dollar Single Parentheses Dollar Q )$?`](#-dollar-single-parentheses-dollar-q-)
- [`$(( Dollar Double Parentheses ))`](#-dollar-double-parentheses-)
- [`[ Single Square Brackets ]`](#-single-square-brackets-)
- [`[[ Double Square Brackets ]]`](#-double-square-brackets-)
- [`Function Parens/Braces() { ... }`](#function-parensbraces---)
- [`{ Single Curly Braces }`](#-single-curly-braces-)
- [`${ Dollar Braces }`](#-dollar-braces-)
- [`<<Double Angle Heredocs`](#double-angle-heredocs)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## `( Single Parentheses )`

### Subshell

- Running commands inside in a subshell.
  This means that they run through all the commands inside,
  and then return a single exit code.

- Any variables declared or environment changes will get cleaned up and disappeared.

- Because it's within a subshell,
  if you have it inside a loop,
  it will run a little slower than if you called the commands without the parentheses.

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/subshell.sh) -->
<!-- The below code snippet is automatically added from ./labs/subshell.sh -->

```sh
#!/usr/bin/env bash

set -eou pipefail

str="Harrison Van"

(
  # shellcheck disable=SC2030
  # SC2030: Modification of str is local (to subshell caused by (..) group).
  str="ShopBack"
  echo "$str"
)

# shellcheck disable=SC2031
# SC2031: str was modified in a subshell. That change might be lost.
echo "$str"
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/subshell.console) -->
<!-- The below code snippet is automatically added from ./labs/subshell.console -->

```console
harrison@shopback:~$ labs/subshell.sh

ShopBack
Harrison Van
```

<!-- AUTO-GENERATED-CONTENT:END -->

### Array

The second usage is in declaring arrays.
Now, arrays and associative arrays are only available in newer versions of Bash,
and there are a lot of weird edge cases and syntax rules
that make it easy to make mistakes using them–so much
so that I try to steer Bash newbies clear of
their usage unless they're definitely the right tool to use.
But, for completeness's sake:

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/array.sh) -->
<!-- The below code snippet is automatically added from ./labs/array.sh -->

```sh
#!/usr/bin/env bash

set -eou pipefail

cheeses=("cheddar" "swiss" "provolone" "brie")
printf "\${cheeses[1]} = %s\n" "${cheeses[1]}"

printf "\n"

cheeses+=("american")
for cheese in "${cheeses[@]}"; do
  printf "\$cheese = %s\n" "$cheese"
done
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/array.console) -->
<!-- The below code snippet is automatically added from ./labs/array.console -->

```console
harrison@shopback:~$ labs/array.sh

${cheeses[1]} = swiss

$cheese = cheddar
$cheese = swiss
$cheese = provolone
$cheese = brie
$cheese = american
```

<!-- AUTO-GENERATED-CONTENT:END -->

In the input inside the parentheses,
Bash uses the current environment variable $IFS (field separator)
and will split the array string on any character found in $IFS.
So one way you can split a string on a character is something like this:

There's a whole bunch more to dive into here,
and a ton of gotchas to look out for, but that's a whole nother article.
I'll put it on the list of drafts to write.
This should give you enough of a feel to not freak out
if you see it in somebody's Bash script, though. :)

## `(( Double Parentheses ))`

### Arithmetic Expansion

This is for use in integer arithmetic.
You can perform assignments, logical operations, and mathematic operations
like multiplication or modulo inside these parentheses.
However, do note that there is no output.
Any variable changes that happen inside them will stick,
but don't expect to be able to assign the result to anything.
If the result inside is non-zero, it returns a zero (success) exit code.
If the result inside is zero, it returns an exit code of 1.

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/arithmetic.sh) -->
<!-- The below code snippet is automatically added from ./labs/arithmetic.sh -->

```sh
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
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/arithmetic.console) -->
<!-- The below code snippet is automatically added from ./labs/arithmetic.console -->

```console
harrison@shopback:~$ labs/arithmetic.sh

7
0
```

<!-- AUTO-GENERATED-CONTENT:END -->

## `<( Angle Parentheses )`

### Process Substitution

This is known as a process substitution.
It's a lot like a pipe, except you can use it anywhere a command expects a file argument.
And you can use multiple at once!

This works because the sort command expects one or many filenames as arguments.
Behind the scenes, the `<( stuff )` actually outputs
the name of a temporary file (unnamed pipe file) for the sort command to use.

Another example of where this comes in handy is the use of the comm command,
which spits out the lines that the files have in common.
Because comm needs its input files to be sorted, you could either do this:

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/process_substitution.sh) -->
<!-- The below code snippet is automatically added from ./labs/process_substitution.sh -->

```sh
#!/usr/bin/env bash

set -eou pipefail

# sort -nr -k 5 <(ls -l /bin) <(ls -l /usr/bin) <(ls -l /sbin)

# => Like a billion lines of output that contain many of the
# => executables on your computer, sorted in order of descending size.

# Just in case you don't magically remember all bash flags,
# -nr  means sort numerically in reverse (descending) order
# -k 5 means sort by Kolumn 5.  In this case, for `ls -l`, that is the "file size"

# The lame way
# sort file1 > file1.sorted
# sort file2 > file2.sorted
# comm -12 file1.sorted file2.sorted

# Ooooor, you can be a total BAshMF and do it this way:
# The baller way
# comm -12 <( sort file1 ) <( sort file2 )
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/process_substitution.console) -->
<!-- The below code snippet is automatically added from ./labs/process_substitution.console -->

```console
harrison@shopback:~$ labs/process_substitution.sh
```

<!-- AUTO-GENERATED-CONTENT:END -->

## `$( Dollar Single Parentheses )`

### Command Substitution

This is for interpolating a subshell command output into a string.
The command inside gets run inside a subshell,
and then any output gets placed into whatever string you're building.

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/command_substitution.sh) -->
<!-- The below code snippet is automatically added from ./labs/command_substitution.sh -->

```sh
#!/usr/bin/env bash

set -eou pipefail

# intro="My name is $( whoami )"
# echo "$intro"
# => My name is ryan

# And just to prove that it's a subshell...
# a=5
# b=$( a=1000; echo $a )
# echo "$b"
# => 1000

# echo $a
# => 5
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=./labs/command_substitution.console) -->
<!-- The below code snippet is automatically added from ./labs/command_substitution.console -->

```console
harrison@shopback:~$ labs/command_substitution.sh
```

<!-- AUTO-GENERATED-CONTENT:END -->

## `$( Dollar Single Parentheses Dollar Q )$?`

## `$(( Dollar Double Parentheses ))`

## `[ Single Square Brackets ]`

## `[[ Double Square Brackets ]]`

## `Function Parens/Braces() { ... }`

## `{ Single Curly Braces }`

## `${ Dollar Braces }`

## `<<Double Angle Heredocs`

What is a heredoc?

## References

- [Bash Brackets Quick Reference](https://www.assertnotmagic.com/2018/06/20/bash-brackets-quick-reference)

- <https://www.linux.com/tutorials/all-about-curly-braces-bash/>
  `{Curly Braces}`
  `parenthesis ()`

- <https://linuxconfig.org/bash-scripting-parenthesis-explained>
