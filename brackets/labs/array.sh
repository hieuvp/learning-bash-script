#!/usr/bin/env bash

set -eou pipefail

cheeses=("cheddar" "swiss" "provolone" "brie")
printf "\${cheeses[1]} = %s\n" "${cheeses[1]}"

printf "\n"

cheeses+=("american")
for cheese in "${cheeses[@]}"; do
  printf "\$cheese = %s\n" "$cheese"
done
