#!/usr/bin/env ruby

require 'timing_method'

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

timing_method do

  sum = 0
  digits =  (2**1000).to_s.each_char{|b| sum += b.to_i}
  puts sum

end
