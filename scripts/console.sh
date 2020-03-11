#!/usr/bin/env bash

args=("$@")
set -eou pipefail

readonly WORKING_DIR="${args[0]}"
readonly SCRIPT_DIR="${args[1]}"

FILES=$(
  git ls-files \
    | grep -E "^${WORKING_DIR}/${SCRIPT_DIR}/.+\.sh$" \
    | xargs -L 1 -I _ realpath --relative-to="$WORKING_DIR" _
)

readarray -t FILES < <(printf "%s" "$FILES")
declare -ra FILES

main() {
  local output

  for file in "${FILES[@]}"; do
    output=$(echo "${file}" | sed -E "s/^(.+)\.sh$/\1\.console/")

    printf "harrison@shopback:~$ %s\n\n" "$file" > "$output"
    bash -c "$file" >> "$output"
  done
}

cd "$WORKING_DIR"
main
