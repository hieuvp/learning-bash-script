# A First Look at Shell Scripts

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Creating A Shell Script](#creating-a-shell-script)
- [Internal Variables](#internal-variables)
  - [IFS](#ifs)
  - [Positional Parameters](#positional-parameters)
  - [Special Parameters](#special-parameters)
- [Demo: A Note-Taking Script](#demo-a-note-taking-script)
- [Calling The Script](#calling-the-script)
- [The Shebang](#the-shebang)
- [--------------------------](#--------------------------)
- [Naming Your Script](#naming-your-script)
- [Demo: The type Command](#demo-the-type-command)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Creating A Shell Script

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

## Internal Variables

- <https://riptutorial.com/bash/topic/4797/internal-variables>

### IFS

> Internal Field Separator.

- <https://riptutorial.com/bash/example/16872/-ifs>
- <https://riptutorial.com/bash/example/19453/what--when-and-why->
- <https://bash.cyberciti.biz/guide/$IFS>
- <https://bash.cyberciti.biz/guide/$IFS>

### Positional Parameters

### Special Parameters

More clear docs

- <https://riptutorial.com/bash/example/16891/-->

| Character | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| :-------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|   `$?`    | Expands to the exit status of the most recently executed foreground pipeline.                                                                                                                                                                                                                                                                                                                                                              |
|   `$-`    | A hyphen expands to the current option flags as specified upon invocation, by the set built-in command, or those set by the shell itself (such as the -i).                                                                                                                                                                                                                                                                                 |
|   `$$`    | Expands to the process ID of the shell.                                                                                                                                                                                                                                                                                                                                                                                                    |
|   `$!`    | Expands to the process ID of the most recently executed background (asynchronous) command.                                                                                                                                                                                                                                                                                                                                                 |
|   `$_`    | The underscore variable is set at shell startup and contains the absolute file name of the shell or script being executed as passed in the argument list. Subsequently, it expands to the last argument to the previous command, after expansion. It is also set to the full pathname of each command executed and placed in the environment exported to that command. When checking mail, this parameter holds the name of the mail file. |

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/special-parameters.sh) -->
<!-- The below code snippet is automatically added from labs/special-parameters.sh -->

```sh
#!/usr/bin/env bash

printf "\n"

#### https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html
#### Positional Parameters
# Expands to the name of the shell or shell script
printf "\$0 = %s\n" "$0"
printf "\n"

printf "\$1 = %s\n" "$1"
printf "\$2 = %s\n" "$2"
printf "\$3 = %s\n" "$3"
printf "\n"

# Expands to the positional parameters, starting from one
# When the expansion occurs within double quotes,
# each parameter expands to a separate word.
printf "\$@ = %s\n" "$@"
printf "\n"

# Expands to the positional parameters, starting from one
# When the expansion occurs within double quotes,
# it expands to a single word with the value of each parameter
# separated by the first character of the IFS special variable
printf "\$* = %s\n" "$*"
printf "\n"

# Expands to the number of positional parameters in decimal
printf "\$# = %s\n" "$#"
printf "\n"
```

<!-- AUTO-GENERATED-CONTENT:END -->

```shell script
labs/special-parameters.sh Good Morning Harrison
```

$@?
\$\*: hold all arguments?

- <https://coderwall.com/p/85jnpq/bash-built-in-variables>
- <https://unix.stackexchange.com/questions/41571/what-is-the-difference-between-and>
- <https://eklitzke.org/bash-$%2A-and-$@>
- <https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Special-Parameters>
- <https://unix.stackexchange.com/questions/129072/whats-the-difference-between-and/129077>

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

## The Shebang

> shebang `/ʃɪˈbæŋ/`.

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

# Downside
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

Comparison

## --------------------------

## Naming Your Script

## Demo: The type Command

```shell script
$ type test
test is a shell builtin
```

```shell script
type cp
```

```shell script
where
which
```

## References

- [Special Parameters](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)
