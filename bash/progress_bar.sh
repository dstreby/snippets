#!/usr/bin/env bash

################################################################################
# Print an inline progress bar in the terminal.                                #
################################################################################

readonly FIXED_SPACE=9
readonly WIDTH=$(echo "$(tput cols)-${FIXED_SPACE}" | bc)

progress_bar() {
  local percent=$1
  local block_count=$(echo "((${percent}*${WIDTH})/100)" | bc)
  local empty_count=$(echo "(${WIDTH}-${block_count})" | bc)
  local blocks=$(printf "%0.s#" $(seq 0 $block_count) | cut -c2-)
  local empty=$(printf "%0.s-" $(seq 0 $empty_count) | cut -c2-)

  echo -ne "\r[ ${blocks}${empty} ] ${percent}% "
}

################################################################################
# Usage example:
#
# Note this requires the two readonly vars defined outside the function
# Call function with percentage at which to re-draw the progress bar
#
for i in {0..100}; do
  progress_bar "$i"
done
#
################################################################################
