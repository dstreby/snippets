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
  printf "$fmt_str" "$unpadded_num"

}

################################################################################
# Usage example:
#
#  $ PAD_NUM=0008
#  $ echo $PAD_NUM
#  0008
#  $ PAD_NUM=$(increment_padded_num $PAD_NUM)
#  $ echo $PAD_NUM
#  0009

################################################################################
