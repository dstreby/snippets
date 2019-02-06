#!/usr/bin/env bash

exec 5>&1

filter='(((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
for pcap in $(ls *.pcap); do
  echo -e "Checking Packet Capture ${pcap}...\n"

  diff_out=$(diff \
    <(tcpdump -r ${pcap} -n "dst port 80 and ${filter}" 2>/dev/null | awk '/HTTP\// {print $3}' | sort | uniq -c) \
    <(tcpdump -r ${pcap} -n "src port 80 and ${filter}" 2>/dev/null | awk '/HTTP\// {print $5}' | sort | uniq -c | tr -d ':') \
    | tee /dev/fd/5; exit ${PIPESTATUS[0]})

  ret=$?

  if [ "$ret" -eq 0 ]; then
    echo -e "\033[0;32mNo imbalance detected\033[0m\n"
  else
    echo
    echo '********************************************'
    ports=$(echo "$diff_out" | awk  -F'.' '/[<>]/ {print $NF}' | sort | uniq)
    while read -r port; do
      echo -e "\033[0;31mPacket capture for transaction on port ${port}:\033[0m"
      tcpdump -tttt -n -r ${pcap} "port ${port}"
      echo
    done <<< "$ports"
  fi

  echo "---------------------------------------------"
done
