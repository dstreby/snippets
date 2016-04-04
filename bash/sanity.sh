#!/usr/bin/env bash

################################################################################
# Little chunks of sanity for use in defensive bash scripts everywhere!        #
################################################################################

# Sanely define runtime vars:
readonly PROGNAME=$(basename $0)
readonly SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
readonly ARGS="$@"

# Iterate through a file (line-by-line):
while IFS='' read -r line || [[ -n "$line" ]]; do
  echo "Text read from file: $line"
done < "$filename"
