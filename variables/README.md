# Variables

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Demo: Variables](#demo-variables)
- [Variable Basics](#variable-basics)
- [Using Variables in A Script](#using-variables-in-a-script)
- [Using Variables: Good Habits](#using-variables-good-habits)
- [Reading Input](#reading-input)
- [Debugging your Script](#debugging-your-script)
- [Summary](#summary)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<https://www.linux.com/tutorials/all-about-curly-braces-bash/>
`{Curly Braces}`
`parenthesis ()`

Create another PR for this?
<https://www.assertnotmagic.com/2018/06/20/bash-brackets-quick-reference/>
<https://linuxconfig.org/bash-scripting-parenthesis-explained>

## Demo: Variables

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/demo.sh) -->
<!-- The below code snippet is automatically added from labs/demo.sh -->

```sh
#!/usr/bin/env bash

greeting="Good morning"
echo "$greeting, $USER"

userGreeting="$greeting, $USER"
echo "$userGreeting"

# Case sensitive
# echo "$greeting, $user"

# Finding more global variables as USER above
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
# A man page (short for manual page)
man read

# Simplified and community-driven man pages
tldr read
```

```shell script
# Bash Builtins
man builtins

# Help is a bash built-in
# providing help for bash commands only
help read # For Bash
$ bash
bash-5.0$ help read

run-help read # For ZSH
```

```shell script
$ labs/demo.sh
Good morning, hieu.van
Good morning,
```

## Variable Basics

variables are case-sensitive

Uppercase variables

- Bash has many pre-defined variables
- PATH, HOME, SECONDS, IFS, etc.
- You don't want to override them by mistake

Good habit

- Use lower-case name for your variable

## Using Variables in A Script

## Using Variables: Good Habits

Environment variables or shell variables that are introduced by the operating system,
shell startup scripts,
or by the shell itself etc.
are usually all in CAPITALS.

To prevent your own variables from conflicting with these variables,
it is a good practice to use lower_case variable names.
Considering camelCase

<https://unix.stackexchange.com/questions/42847/are-there-naming-conventions-for-variables-in-shell-scripts>

<https://google.github.io/styleguide/shell.xml>
--> Should bookmarked?

<https://github.com/progrium/bashstyle>
--> Check style guild here

## Reading Input

## Debugging your Script

## Summary

## References
