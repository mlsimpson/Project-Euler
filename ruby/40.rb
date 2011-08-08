#!/usr/bin/env ruby -wKU

require "timing_method"

# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000

timing_method do

  i = 0
  nums = Array.new
  while i < 185_250
    nums << (i += 1)
  end

  nums = nums.to_s

  i = 1
  product = 1
  iter = 0
  while iter < 7
    product *= nums[(i - 1), 1].to_i
    i *= 10
    iter += 1
  end

  puts "The value of the expression is #{product}."

end
