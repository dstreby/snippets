#!/usr/bin/env python

import string
from math import floor

ALPHABET = '23456789bcdfghjkmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ'
BASE = len( ALPHABET )

def encode(number):
  string = ''
  while number:
    string = ALPHABET[int(number % BASE)] + string
    number = floor(number / BASE)
  return string

def decode(string):
  number = 0
  for char in string:
    number = BASE * number + ALPHABET.find(char)
  return number
