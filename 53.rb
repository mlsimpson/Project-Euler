#!/usr/bin/env ruby -wKU

require "timing_method"

# There are exactly ten ways of selecting three from five, 12345:
#
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
#
# In combinatorics, we use the notation, 5C3 = 10.
#
# In general,
#
# nCr =
# n!/r!(n-r)!, where r <= n, n! = n(n1)*...*3*2*1, and 0! = 1.
#
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
#
# How many, not necessarily distinct, values of nCr, for 1 <= n <= 100, are greater than one-million?

# Pascal's Triangle again (See Problem 15)
# If nCr > x, then nCr..nC(n-r) > x
#   => the range of values in a given n is (n-r) - r + 1. (The +1 accounts for arrays indexed at 0)
#     => (n-r) + r + 1 = n + 1 - 2r
#
# Start at n = 23
# Compare to max value of 1_000_000
# finish at n = 100
# Only have to check up until middle of triangle due to Pascal's Triangle symmetry
#   => r <= (n/2) + 1
# First two rows of Pascal's Triangle are (1), (n).  These will never exceed 1_000_000, so start at r = 2

def nchooser(n, r)

  (1..n).reduce(:*) / ( (1..r).reduce(:*) * (1..(n-r)).reduce(:*) )

end

timing_method do

  total = 0
  max = 1_000_000

  (23..100).each{|n|
    (2..(n/2)).each{|r|
      if nchooser(n, r) > max
        total += (n + 1 - 2*r)
        break
      end
    }
  }

  puts "The number of values of nCr for 1 <= n <= 100 that are greater than 1_000_000 is #{total}"

end
