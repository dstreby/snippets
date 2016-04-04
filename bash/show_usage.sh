#!/usr/bin/env bash

################################################################################
# Print a detailed usage statement for a script.                               #
################################################################################

show_usage() {
  cat <<-EOF
  usage: $PROGNAME options

  Description of what this program does

  OPTIONS:
    -a --optiona    option A - Requires argument
    -b --optionb    option B - Requires argument
    -c --optionc    option C
    -d --optiond    option D

EOF
}

################################################################################
# Usage example:
#
# Typically will be used with parse_script_arguments function.
# But seriously... just call it:
#
readonly PROGNAME=$(basename $0)
show_usage
#
################################################################################
