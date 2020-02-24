# Learning Bash Script

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Bash](#bash)
- [Makefile](#makefile)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Bash

1. [ ] [A First Look at Shell Scripts](a-first-look-at-shell-scripts/README.md)
1. [Variables](variables/README.md)
1. [Brackets](brackets/README.md)
1. [ ] [If, Then, Else](if-then-else/README.md)
1. [ ] [Input and Output](input-and-output/README.md)
1. [ ] [Control Flow](control-flow/README.md)
1. [ ] [Variables 2](variables-2/README.md)
1. [ ] [Handling Script Parameters](handling-script-parameters/README.md)
1. [ ] [Shell Functions](shell-functions/README.md)
1. [ ] [Fun with Strings](fun-with-strings/README.md)
1. [ ] [Many Ways to Run Your Script](many-ways-to-run-your-script/README.md)

Learning string

- awk
- sed
- cut
- xargs -L 1: to trim string

```text
# xargs:
# - Take output of a command and pass it as argument to another command
# - If no command is specified, "xargs" executes "echo" by default
```

- grep
- ...

Learning declaration

- local
- declare
- mapfile
- readonly
- eval

Learning loop

- for
- while

Printing

- echo -en
- echo
- printf
- `printf " -%.0s" {1..35}`

If

- [[
- [
- test
- !
- `if ! status "."; then`

Learning compare operators

- <https://linuxize.com/post/how-to-compare-strings-in-bash/>
- -eq, -gt, ...
- =~
- =~ ^[a-zA-Z]+\$
- ==
- !=
- `!= *"Your branch is up to date with"*`
- ...

Learning

- &&
- ||
- &
- |

Learning

- Subshell `()`
- Grouping `{ command }`

Learning

- `case $answer in`
- `if`

Learning array

Learning export

- export
- export -f
- `bash -c main`
- ...

`while getopts 'w' option; do`

```bash
declare_submodule_paths="$(declare -p SUBMODULE_PATHS)"
export declare_submodule_paths
```

## Makefile

## References

- [Shell Scripting with Bash](https://app.pluralsight.com/library/courses/bash-shell-scripting/table-of-contents)
- [Makefile and GNU make to build projects on Linux/Unix system](https://www.udemy.com/course/gnu-make-make-utility-and-makefile)
- [Makefile Tutorial by Example](https://makefiletutorial.com/)
