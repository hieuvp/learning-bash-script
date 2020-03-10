#!/usr/bin/env bash

# Ideas:
# - Generate Script Execution Output
# - Put into markdown for auto-generation markdown

args=("$@")
set -eou pipefail

readonly OUTPUT_PATH="output"
readonly LAB_PATH="${args[0]}"

FILES=$(git ls-files | grep --extended-regexp "^${LAB_PATH}\/.+\.sh$")
readarray -t FILES < <(printf "%s" "$FILES")
declare -ra FILES

main() {
  for file in ="${FILES[@]}"; do
    echo "$ ${file}"
  done
}

main
