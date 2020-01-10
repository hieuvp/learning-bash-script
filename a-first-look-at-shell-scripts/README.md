# A First Look at Shell Scripts

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Introduction](#introduction)
- [Creating A Shell Script](#creating-a-shell-script)
- [Demo: A Note-Taking Script](#demo-a-note-taking-script)
- [Calling The Script](#calling-the-script)
- [The Shebang](#the-shebang)
- [Naming Your Script](#naming-your-script)
- [Demo: The type Command](#demo-the-type-command)
- [Summary](#summary)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

## Creating A Shell Script

```shell script
chmod u+x filename
# --> should add to fmt-shell.sh?
```

```shell script
chmod a+x filename
chmod u-x filename
chmod a-x filename
```

shebang: pronounce

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/take-note.sh) -->
<!-- The below code snippet is automatically added from labs/take-note.sh -->

```sh
#!/usr/bin/env bash

# $1?
# $@?
# $*: hold all arguments?

# Command substitution
# $(date)

# > vs >>

#echo $(date): $* >> ~/notes.txt
#echo Note saved: $*
```

<!-- AUTO-GENERATED-CONTENT:END -->

## Demo: A Note-Taking Script

## Calling The Script

## The Shebang

## Naming Your Script

## Demo: The type Command

## Summary

## References
