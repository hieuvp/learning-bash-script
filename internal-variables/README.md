# Internal Variables

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [IFS](#ifs)
- [Positional Parameters](#positional-parameters)
- [Special Parameters](#special-parameters)
- [Environment Variables](#environment-variables)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

- <https://riptutorial.com/bash/topic/4797/internal-variables>

## IFS

> Internal Field Separator.

- <https://riptutorial.com/bash/example/16872/-ifs>
- <https://riptutorial.com/bash/example/19453/what--when-and-why->
- <https://bash.cyberciti.biz/guide/$IFS>
- <https://bash.cyberciti.biz/guide/$IFS>

## Positional Parameters

## Special Parameters

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

## Environment Variables

- <https://riptutorial.com/bash/topic/4797/internal-variables>
- <https://docstore.mik.ua/orelly/linux/lnut/ch08_04.htm>

## References
