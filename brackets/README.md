# Brackets

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`( Single Parentheses )`](#-single-parentheses-)
  - [Subshell](#subshell)
  - [Array](#array)
- [`(( Double Parentheses ))`](#-double-parentheses-)
- [`<( Angle Parentheses )`](#-angle-parentheses-)
- [`$( Dollar Single Parentheses )`](#-dollar-single-parentheses-)
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

Running commands inside in a subshell.
This means that they run through all of the commands inside,
and then return a single exit code.

Any variables declared or environment changes will get cleaned up and disappeared.
Because it’s within a subshell,
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
$ labs/subshell.sh

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
$ labs/array.sh

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

## `<( Angle Parentheses )`

## `$( Dollar Single Parentheses )`

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
