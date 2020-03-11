#!/usr/bin/env bash

# Ideas:
# - Generate Script Execution Output
# - Put into markdown for auto-generation markdown

args=("$@")
set -eou pipefail

readonly WORKING_DIR="${args[0]}"
readonly SCRIPT_DIR="${args[1]}"

FILES=$(
  git ls-files \
    | grep -E "^${WORKING_DIR}/${SCRIPT_DIR}/.+\.sh$" \
    | xargs -L 1 -I _ realpath --relative-to="${WORKING_DIR}" _
)

readarray -t FILES < <(printf "%s" "$FILES")
declare -ra FILES

main() {
  local output_file

  cd "$WORKING_DIR"

  for file in "${FILES[@]}"; do

    output_file=$(
      echo "${file}" | sed -E "s/^(.+)\.sh$/\1\.console/"
    )

    rm -f "${output_file}"
    printf "harrison@shopback:~$ %s\n\n" "${file}" > "${output_file}"
    bash -c "${file}" >> "${output_file}"
  done
}

main
