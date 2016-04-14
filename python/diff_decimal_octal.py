#!/usr/bin/env python3

dec = 0
count = 0

while (dec < 8589934594):
  oct_str = oct(dec)[2:]
  dec_str = str(dec)
  
  zipped = zip(dec_str[::-1],oct_str[::-1])
  
  diff = 0
  
  if len(oct_str) > len(dec_str) + 1:
    break
  elif len(oct_str) == len(dec_str) + 1:
      diff += 1
  
  for i,j in zipped:
      if i!=j:
          diff += 1

  if diff < 2:
    print("Dec: %s\tOct: %s\tDiffs: %d" % (dec_str,oct_str,diff))
    count += 1

  dec += 1

print("Total numbers compared: %d" % (dec))
print("Total with 1 or fewer digit diffs: %d" % (count))
