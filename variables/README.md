# Variables

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Demo: Variables](#demo-variables)
- [Variable Basics](#variable-basics)
- [--------------------------------](#--------------------------------)
- [Using Variables in A Script](#using-variables-in-a-script)
- [Using Variables: Good Habits](#using-variables-good-habits)
- [Reading Input](#reading-input)
- [Debugging your Script](#debugging-your-script)
- [Summary](#summary)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Demo: Variables

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/demo.sh) -->
<!-- The below code snippet is automatically added from labs/demo.sh -->

```sh
#!/usr/bin/env bash

greeting="Good morning"
echo "$greeting, $USER"

user_greeting="$greeting, $USER"
echo "$user_greeting"

# Case sensitive
# echo "$greeting, $user"

# Finding more global variables as USER above
# Pre-defined variables are all UPPERCASE
```

<!-- AUTO-GENERATED-CONTENT:END -->

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

## --------------------------------

## Using Variables in A Script

## Using Variables: Good Habits

Environment variables or shell variables that are introduced by the operating system,
shell startup scripts, or by the shell itself etc. are usually all in CAPITALS.

To prevent your own variables from conflicting with these variables,
it is a good practice to use lower_case variable names.
Considering camelCase

More here:

- <https://stackoverflow.com/questions/673055/correct-bash-and-shell-script-variable-capitalization>
- <https://google.github.io/styleguide/shell.xml>

Keeping to this convention,
you can rest assured that you don't need to know every environment variable
used by UNIX tools or shells in order to avoid overwriting them.
If it's your variable, lowercase it. If you export it, uppercase it.

Use all caps and underscores for exported variables and constants,
especially when they are shared across multiple scripts or processes.

- Exported variables with a common prefix: JOB_HOME JOB_LOG JOB_TEMP JOB_RUN_CONTROL
- Constants: LOG_DEBUG LOG_INFO LOG_ERROR STATUS_OK STATUS_ERROR STATUS_WARNING

## Reading Input

## Debugging your Script

- `-x`:
- set `-x`, set `+x`

## Summary

## References

- [Shell Style Guide](https://google.github.io/styleguide/shell.xml)
