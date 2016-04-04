#!/usr/bin/env bash

################################################################################
# Parse through command line arguments passed to script.                       #
################################################################################

parse_script_args() {
  
  local arg=
  for arg
  do
    local delim=""
    case "$arg" in
      #translate --gnu-long-option to -g (short options)
      --optiona)    args="${args}-a ";;
      --optionb)    args="${args}-b ";;
      --optionc)    args="${args}-c ";;
      --optiond)    args="${args}-d ";;
      #pass through anything else
      *) [[ "${arg:0:1}" == "-" ]] || delim="\""
        args="${args}${delim}${arg}${delim} ";;
    esac
  done

  #Reset the positional parameters to short options
  eval set -- $args

  # NOTE: Options with arguments are followed with a colon
  # Options without arguments are not.
  while getopts "a:b:cd" OPTION
  do
    case $OPTION in
      a)
        readonly ARG_A="$OPTARG"
        echo "Option A: $ARG_A"
        ;;
      b)
        readonly ARG_B="$OPTARG"
        echo "Option B: $ARG_B"
        ;;
      c)
        readonly OPT_C='1'
        echo "Option C"
        ;;
      d)
        readonly OPT_D='1'
        echo "Option D"
        ;;
    esac
  done

  return 0
}

################################################################################
# Usage example:
#
# Include entire function as part of larger bash script
# call function with script arguments at runtime. e.g.:
#
readonly ARGS="$@"
parse_script_args $ARGS
#
################################################################################
