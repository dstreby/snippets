#!/usr/bin/env python3

###########################################
# My solution to problem presented here:  #
# https://www.codeeval.com/public_sc/42/  #
###########################################

import itertools
import re

def evaluate(exp):
  # We need to do this so eval won't interpret numbers
  # with leading zeros as being octal. It's annoying.
  return eval(re.sub(r'([0-9]*)', 'int("\\1")', exp))

def isugly( num ):
  for prime in (2,3,5,7):
    if num % prime == 0:
      return 1
  return 0

def expressions( num ):
  ugly_count = 0
  for tuple in itertools.product(' +-', repeat=(len(num)-1)):
    exp = ''
    i = 0

    for digit in str(num):
      exp += digit
      i += 1
      if i <= len(tuple):
        exp += tuple[i-1]

    exp = exp.replace(" ","")
    ugly_count += isugly(evaluate(exp))

  return ugly_count

f = open("test_set","r")
g = open("result_set","w")
for line in f:
  num = line.rstrip()
  count = expressions(num)
  print("Number: %s has %d uglies" % (num, count))
  g.write(str(count))
  g.write("\n")
f.close()
g.close()
