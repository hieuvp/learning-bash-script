# A First Look at Shell Scripts

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Creating A Shell Script](#creating-a-shell-script)
- [Demo: A Note-Taking Script](#demo-a-note-taking-script)
- [Calling The Script](#calling-the-script)
- [The Shebang](#the-shebang)
- [Naming Your Script](#naming-your-script)
- [Demo: The `type` Command](#demo-the-type-command)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Creating A Shell Script

- A file containing commands
- Executed by your shell
- Don't forget to set permissions
- Comments start with `#`

```shell script
# The manual page
man chmod

# Simplified and community-driven man pages
tldr chmod
```

```shell script
# Give the [u]ser who owns a file the right to execute it:
$ chmod u+x file
# --> should add to fmt-shell.sh?
```

```shell script
# Give [a]ll users rights to read and execute:
chmod a+rx file
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

# Command substitution
# $(date)

# ">" vs ">>"?
# Called "Redirection"?

# echo $(date): $* >> /tmp/learning-bash-script/notes.txt
# echo Note saved: $*

echo "$1" >> $file
echo "Note saved"

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

## Calling The Script

```shell script
# What does the "PATH" mean here ?
# Can call this script globally, without including the directory
# Add to your path
PATH="$PATH:~/bin"
```

- `bin/` conventional name

- Add script to your PATH
- Or call it with full pathname

## The Shebang

> shebang `/ʃɪˈbæŋ/`.

Or Hash bang?
hash => `#`
bang => `!`

Shebang line:

- First line of file
- Start with `#!`
- Specify which interpreter to run the code
- Specify options for interpreter

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/shebang.sh) -->
<!-- The below code snippet is automatically added from labs/shebang.sh -->

```sh
#!/bin/bash

echo "Version: $BASH_VERSION"
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
labs/shebang.sh
```

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/shebang-with-env.sh) -->
<!-- The below code snippet is automatically added from labs/shebang-with-env.sh -->

```sh
#!/usr/bin/env bash

# Other systems than Linux and Mac OS
# May have bash in a different location
# This will find bash on the user's PATH

# Downside (Drawback)
# Cannot give options
# Result depends on the user's configuration

echo "Version: $BASH_VERSION"

#!/usr/bin/env searches PATH for bash,
# and bash is not always in /bin, particularly on non-Linux systems.
# For example, on my OpenBSD system, it's in /usr/local/bin,
# since it was installed as an optional package.

# If you are absolutely sure bash is in /bin and will always be,
# there's no harm in putting it directly in your shebang
# but I'd recommend against it because scripts
# and programs all have lives beyond what we initially believe they will have.
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
labs/shebang-with-env.sh
```

## Naming Your Script

- Don't name your script `test`, `if` or `ls`

  - Conflicts with existing commands

- Does a command with the same name exist
  - Use commands in below section (e.g. `type`)

## Demo: The `type` Command

```shell script
$ type test
test is a shell builtin
```

```shell script
$ type cp
cp is /usr/local/opt/coreutils/libexec/gnubin/cp
```

```shell script
$ type foo
foo not found
```

```shell script
where
which
```

## References

- [Special Parameters](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)
