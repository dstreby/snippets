#!/usr/bin/env bash

# Annoying shennanigans to deal with the date command on OS-X
if [[ "$(uname -s)" == "Darwin" ]]; then
  if ! command -v 'gdate' >/dev/null 2>&1; then
    (>&2 echo "This function requires 'gdate' on OS-X, please install it")
    exit 1
  else
    readonly datecmd=gdate
  fi
else
  readonly datecmd=date
fi

# Make sure openssl is installed
if ! command -v 'openssl' >/dev/null 2>&1; then
  (>&2 echo "This function requires 'openssl', please install it")
  exit 1
fi

# Define variables for time calculations
readonly sinm=60
readonly sinh=3600
readonly sind=86400
readonly sinw=604800
readonly sinf=1209600

# Grab user arguments
domain=${1:?}
port=${2:-443}

# Pull the site's certificate and extract the end date
cert_enddate=$(
  echo \
    | openssl s_client -showcerts -servername ${domain} -connect ${domain}:${port} 2>/dev/null \
    | openssl x509 -inform pem -noout -enddate \
    | cut -d= -f 2
)

# Convert certificate end date to epoch time
cert_end_epoch=$($datecmd --date="$cert_enddate" +"%s")

# Get the current epoch time
current_time=$($datecmd +"%s")

# Calculate seconds from current time to cert end
date_diff=$(($cert_end_epoch-$current_time))

# Get some readable time values
days=$((${date_diff}/${sind}))
hours=$(((${date_diff}%${sind})/${sinh}))
minutes=$(((${date_diff}%${sinh})/${sinm}))

# Print the remaining time
(>&2 echo "Time until certificate expiration: ${days} days, ${hours} hours, ${minutes} minutes.")

# Set exit status based on remaining time; 2 if there's less than 2 weeks, 3 if there's less than 1 week
if (( ${date_diff} < ${sinw} )); then
  exit 3
elif (( ${date_diff} < ${sinf} )); then
  exit 2
else
  exit 0
fi
