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
- [--------------------------------](#--------------------------------)
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
man read

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

Bash variables have no type

- Basically just store a string

Names:

- Only letters, numbers, and underscore are allowed
- First character should be a letter or an underscore
- Variable names are case-sensitive

Uppercase variables:

- Bash has many pre-defined variables
- PATH, HOME, SECONDS, IFS, etc.
- You don't want to override them by mistake

Good habit

- Use lower-case names for your variables

## Using Variables in A Script

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/take-note.sh) -->
<!-- The below code snippet is automatically added from labs/take-note.sh -->

```sh
#!/usr/bin/env bash

set -eoux pipefail

# Get the date
# date=$(date)

# Ask user for input
# read -r note

# -p prompt
read -r -p "Your note: " note

# echo "$note"

# help read

# echo $date: $note >> ~/$topicnotes.txt
# echo $date: $note >> ~/"${topic}"notes.txt
# Reason for using "{}" ?
# Another kind? (), ...?

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
```

<!-- AUTO-GENERATED-CONTENT:END -->

- `quotes` vs `double quotes`. What the difference?
  - single quotes escape every character between them.

```shell script
$ echo '$note'
# $note

echo \'$note'\
```

## Using Variables: Good Habits

Surround your variables with quotes

- Use `"$x"` instead of `$x`
- Prevent surprises when it contains spaces
- Use double quotes: keep meaning of dollar sign intact

Braces `{}`

- Where does your variable name end?
- `echo "${foo}bar"`
- prints value of var `"foo"` followed by string `"bar"`
- `echo "$foobar"` prints value of `"foobar"`
- Using braces a lot is a Good Habit

Use `$HOME` instead of `~`

- Some context, like using double quotes, the `~` may not be expanded by bash
  and give an unexpected result.

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

read

- Reads a line of input into a variable
- `read var`
- Is a shell builtin
- `help read`
- `man builtins`
- `read -p "Type your name:" name`

## Debugging your Script

- `#!/bin/bash -x`
- `set -x pipefail`

To debug several lines:

- set `-x`
- set `+x`

## --------------------------------

## Summary

Variables

- Assign value
- Get value `($)`
- No whitespace around `=`

Variable names

- Use lowercase names

Using variables

- Quotes
- Braces

Reading input

- read

Debugging

- Use `-x` option in hashbang line
- Or use `"set -x"` to enable and `"set +x"` to disable

## References

- [Shell Style Guide](https://google.github.io/styleguide/shell.xml)
