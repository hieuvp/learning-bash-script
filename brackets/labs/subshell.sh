#!/usr/bin/env bash

set -eou pipefail

str="Harrison Van"

(
  # shellcheck disable=SC2030
  # SC2030: modification of str is local (to subshell caused by (..) group)
  str="ShopBack"
  echo "$str"
)

# shellcheck disable=SC2031
# SC2031: str was modified in a subshell, that change might be lost
echo "$str"
