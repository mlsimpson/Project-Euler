#!/usr/bin/env ruby

require 'timing_method'

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

timing_method do

  limit = 50000

  total = 0

  (3..limit).each{|num|
    digits = num.to_s.chars.map{|digit|
      digit.to_i
    }
    if num == digits.inject(0){|sum, digit|
      sum += (1..digit).reduce(1, :*)
      sum
    }
      total += num
    end
  }

  puts "The sum of all numbers which are equal to the sum of the factorial of their digits is #{total}."

end
