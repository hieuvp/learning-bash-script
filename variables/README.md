# Variables

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Introduction](#introduction)
- [Demo: Variables](#demo-variables)
- [Variable Basics](#variable-basics)
- [Using Variables in A Script](#using-variables-in-a-script)
- [Using Variables: Good Habits](#using-variables-good-habits)
- [Reading Input](#reading-input)
- [Debugging your Script](#debugging-your-script)
- [Summary](#summary)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

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
$ labs/demo.sh
Good morning, hieu.van
Good morning,
```

## Variable Basics

## Using Variables in A Script

## Using Variables: Good Habits

## Reading Input

## Debugging your Script

## Summary

## References
