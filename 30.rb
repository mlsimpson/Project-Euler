#!/usr/bin/env ruby

require 'timing_method'

# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

timing_method do

  maxnum = 200_000

  total = 0

  (2..maxnum).each{|num|
    numcopy = num
    if numcopy.to_s.chars.to_a.inject(0){|sum, digit| sum += digit.to_i**5} == numcopy
      puts "The sum of the each digit in #{num} to the 5th power is equal to #{num}."
      total += num
    end
  }

  puts "The sum of all the numbers that can be written as the sum of the fifth powers of their digits is #{total}."

end
