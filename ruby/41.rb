#!/usr/bin/env ruby -wKU

require "timing_method"
require "isPrime"

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
# For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?

# Further observation:
# => Any integer whose digits add up to 3 or 9 is divisible by 3 or 9
#   => 9+8+7+6+5+4+3+2+1 = 45; 45 % 9 = 0
#   :: No 9 digit numbers exist.
#   => 8+7+6+5+4+3+2+1 = 36; 36 % 9 = 0
#   :: No 8 digit numbers exist.
#   => 7+6+5+4+3+2+1 = 28
#   !! Check all 7 digit numbers.
#   => 6+5+4+3+2+1 = 21; 21 % 3 = 0
#   :: No 6 digit numbers exist.
#   => 5+4+3+2+1 = 15; 15 % 3 = 0
#   :: No 5 digit numbers exist.
#   => 4+3+2+1 = 10
#   !! Check all 4 digit numbers.
#
# We have a lower limit in the problem text:  2143.
# :: Check all 7 digit numbers, and all 4 digit numbers down to 2143.
#
# sieve(max) takes ~ 7.5 secs.
timing_method do

  i = 7_654_321
  itest = "1234567"

  (7_654_321).downto(1_234_567){|i|
    if i.isPrime?
      ichars = i.to_s.chars.to_a.sort
      if ichars.include?("0") == false
        if ichars.include?("9") == false
          if ichars.include?("8") == false
            if ichars.uniq! == nil
              break
            end
          end
        end
      end
    end
    i -= 2 # Only check odd numbers; no even number > 2 is prime
  }
  p i
end

# Much faster to create an array of permutations.
# Start with 7654321, since the array will then be sorted in descending order.
# The first value discovered is the highest.
timing_method do

  sevendigits = "7654321".chars.to_a.permutation.to_a

  sevendigits.each{|num|
    if num.to_s.to_i.isPrime?
      p num.to_s.to_i
      break
    end
  }
end
