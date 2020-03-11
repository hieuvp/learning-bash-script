#!/usr/bin/env bash

# Ideas:
# - Generate Script Execution Output
# - Put into markdown for auto-generation markdown

args=("$@")
set -eou pipefail

readonly OUTPUT_DIR="output"
readonly SCRIPT_DIR="${args[0]}"

FILES=$(git ls-files | grep -E "^${SCRIPT_DIR}\/.+\.sh$")
readarray -t FILES < <(printf "%s" "$FILES")
declare -ra FILES

main() {
  local output_file
  local output_dir

  for file in "${FILES[@]}"; do
    output_file="${OUTPUT_DIR}/${file}.console"
    output_dir=$(dirname "$output_file")

    if ! [[ -d $output_dir ]]; then
      echo "Creating ${output_dir}"
      mkdir -p "${output_dir}"
    fi

    printf "$ %s\n\n" "${file}" > "${output_file}"
    bash -c "${file}" >> "${output_file}"
  done
}

main
