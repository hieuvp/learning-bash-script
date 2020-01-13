# A First Look at Shell Scripts

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Creating A Shell Script](#creating-a-shell-script)
- [Demo: A Note-Taking Script](#demo-a-note-taking-script)
- [--------------------------](#--------------------------)
- [Calling The Script](#calling-the-script)
- [The Shebang](#the-shebang)
- [Naming Your Script](#naming-your-script)
- [Demo: The type Command](#demo-the-type-command)
- [Summary](#summary)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Creating A Shell Script

```shell script
chmod u+x filename
# --> should add to fmt-shell.sh?
```

```shell script
# To make it executable for everyone
chmod a+x filename

chmod u-x filename
chmod a-x filename
```

## Demo: A Note-Taking Script

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/take-note.sh) -->
<!-- The below code snippet is automatically added from labs/take-note.sh -->

```sh
#!/usr/bin/env bash

declare -r directory="/tmp/learning-bash-script/a-first-look-at-shell-scripts"
declare -r file="$directory/notes.txt"

mkdir -p $directory

# $1?
# $@?
# $*: hold all arguments?

# Command substitution
# $(date)

# ">" vs ">>"?

# echo $(date): $* >> /tmp/learning-bash-script/notes.txt
# echo Note saved: $*

echo "$1" >> $file

cat $file
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
$ labs/take-note.sh Hello
Hello

$ labs/take-note.sh Harrison
Hello
Harrison
```

## --------------------------

## Calling The Script

## The Shebang

shebang: pronounce

```shell script
#!/usr/bin/env bash
```

```shell script
#!/bin/bash
```

Comparison

## Naming Your Script

## Demo: The type Command

```shell script
type ls
```

## Summary

Add `man` and `tldr` to here
