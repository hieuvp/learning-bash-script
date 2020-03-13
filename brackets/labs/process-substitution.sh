#!/usr/bin/env bash

set -eou pipefail

# sort -nr -k 5 <(ls -l /bin) <(ls -l /usr/bin) <(ls -l /sbin)

# => Like a billion lines of output that contain many of the
# => executables on your computer, sorted in order of descending size.

# Just in case you don't magically remember all bash flags,
# -nr  means sort numerically in reverse (descending) order
# -k 5 means sort by Kolumn 5.  In this case, for `ls -l`, that is the "file size"

# The lame way
# sort file1 > file1.sorted
# sort file2 > file2.sorted
# comm -12 file1.sorted file2.sorted

# Ooooor, you can be a total BAshMF and do it this way:
# The baller way
# comm -12 <( sort file1 ) <( sort file2 )
