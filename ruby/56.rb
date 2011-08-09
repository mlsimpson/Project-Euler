#!/usr/bin/env ruby -wKU

require "timing_method"

# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

timing_method do

  max = 0

  (2...100).each{|a|
    (2..100).each{|b|
      ans = a**b
      anssum = ans.to_s.chars.to_a.map!{|digit| digit.to_i }.reduce(:+)
      if anssum > max
        max = anssum
      end
    }
  }

  puts "The maximum digital sum of a^b where a, b < 100 is #{max}."

end
