#!/usr/bin/env bash

set -eou pipefail

git ls-files \
  | grep --extended-regexp ".+\.console$" \
  | xargs -L 1 rm -v
