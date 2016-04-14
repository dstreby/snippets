#!/usr/bin/env bash

#readonly WORKDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#readonly INFILE="${WORKDIR}/unsorted"
readonly UNSORTED=( "$@" )

STRS=
INTS=
INDEX=
OUTPUT=

pos=0
#for i in $(cat "$INFILE"); do
for i in "${UNSORTED[@]}"; do
  case ${i#-} in
    ''|*[!0-9]*)
      STRS=(${STRS[@]} "$i")
      INDEX=(${INDEX[@]} S)
      ;;
    *)
      INTS=(${INTS[@]} "$i")
      INDEX=(${INDEX[@]} I)
      ;;
  esac
  pos=$((pos+1))
done

IFS=$'\n' 
STRS=($(sort <<<"${STRS[*]}"))
INTS=($(sort -g <<<"${INTS[*]}"))

s_pos=0
i_pos=0
for j in "${INDEX[@]}"; do
  case ${j} in
    I)
      OUTPUT=(${OUTPUT[@]} "${INTS[$i_pos]}")
      i_pos=$((i_pos+1))
      ;;
    S)
      OUTPUT=(${OUTPUT[@]} "${STRS[$s_pos]}")
      s_pos=$((s_pos+1))
      ;;
  esac
done

echo "${OUTPUT[@]}"
