#!/usr/bin/env ruby -wKU

require "timing_method"

# It is possible to write five as a sum in exactly six different ways:
#
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at least two positive integers?

# The recursive method is buttcrack slow.  Time to use the dynamic method!
timing_method do
  target = 100

  ways = [1] + Array.new(target, 0)

  (1..target).each{|val|
    (val..target).each{|i|
      ways[i] += ways[i-val]
    }
  }

  # Subtracting 1, since the number itself can not be written as the sum of at least two positive integers.
  p ways[target] - 1

end
