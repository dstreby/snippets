#!/usr/bin/env bash

################################################################################
# Sanely increment a zero padded integer of arbitrary length                   #
################################################################################

increment_padded_num() {
  local padded_num="$1"
  local padded_num_len=$(echo -n "$padded_num" | wc -c | sed 's/[[:blank:]]//g')
  local fmt_str="%0${padded_num_len}d"
  local unpadded_num=$(echo "$padded_num" | sed 's/^0*//')

  (( unpadded_num++ ))
  local unpadded_num_len=$(echo -n "$unpadded_num" | wc -c | sed 's/[[:blank:]]//g')

  if [[ $unpadded_num_len -gt $padded_num_len ]]; then
    >&2 echo "Error: incremented number is longer than input"
    return 1
  fi

  printf "$fmt_str" "$unpadded_num"

}

################################################################################
# Usage example:
#
# Pass function an integer left-padded with zeros,
# receive an incremented integer padded to the same width
#
PAD_NUM=0008
echo $PAD_NUM
PAD_NUM=$(increment_padded_num $PAD_NUM)
echo $PAD_NUM
#
################################################################################
