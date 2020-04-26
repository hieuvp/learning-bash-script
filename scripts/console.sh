#!/usr/bin/env bash

args=("$@")
set -eou pipefail

# shellcheck disable=SC1090
source "${HELPER_SCRIPT_PATH}/init.sh"

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
  local -r file=$1
  local -r output=$(
    echo "${file}" \
      | sed -E "s/^(.+)\.sh$/\1\.console/"
  )

  printf "harrison@shopback:~$ %s\n\n" "$file" > "$output"

  # https://stackoverflow.com/questions/876239/how-to-redirect-and-append-both-stdout-and-stderr-to-a-file-with-bash
  bash -c "$file" >> "$output" 2>&1
}

for file in "${FILES[@]}"; do
  text::yellow "Processing : $file"
  printf "\n"

  (
    cd "$WORKING_DIR"
    main "$file"
  )
done
