#!/usr/bin/env ruby -wKU

require "timing_method"

# How many of the 1st 1000 expansions of the sqrt(2) expansion have a numerator with more digits than the denominator?

# Note that each iteration:
# - The numerator increases by (prevnum + prevden*2)
# - The denominator increases by (prevnum + prevden)
timing_method do
  num = 3
  den = 2
  count = 0

  max = 1000

  (2..max).each{|iter|
    num, den = (num + den*2), num + den
    if num.to_s.length > den.to_s.length
      count += 1
    end
  }
  p count
end
