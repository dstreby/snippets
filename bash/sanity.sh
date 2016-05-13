#!/usr/bin/env bash

################################################################################
# Little chunks of sanity for use in defensive bash scripts everywhere!        #
################################################################################

# Sanely define runtime vars:
readonly PROGNAME=$(basename $0)
readonly SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
readonly ARGS="$@"

# Iterate through a file (line-by-line):
# N.B.: bash 4.1+ required for automatic file descriptor allocation
# replace $READ_FD / {READ_FD} with arbitrary file descriptor for older / BSD
# bash.
readonly IN_FILE=${1:?}
while IFS='' read -u $READ_FD -r line || [[ -n "$line" ]]; do
  echo "Text read from file: $line"
done {READ_FD}< "$IN_FILE"

################################################################################
# Helper functions - useful in many scripts                                    #
################################################################################

# echoerr - send all your errors here!
echoerr() {
  cat <<< "$@" 1>&2
}

# verbose - useful for verbose output. Use script arg to set $VERBOSE
verbose() {
  if [ -n "$VERBOSE" ]; then
    echo -e "$@"
  fi
}

################################################################################
# Test functions.                                                              #
# Example usage:                                                               #
# is_file "$file_to_check \                                                    #
#     || echo "$file_to_check is not a file!"                                  #
################################################################################

is_file() {
  local file="$1"
  [[ -f "$file" ]]
}

is_dir() {
  local dir="$1"
  [[ -d "$dir" ]]
}

is_link() {
  local link="$1"
  [[ -h "$link" ]]
}
