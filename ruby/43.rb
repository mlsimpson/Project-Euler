#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"

# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order,
# but it also has a rather interesting sub-string divisibility property.
#
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
#
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

timing_method do
  primes = sieve(18)

  pandigitals = (0..9).to_a.permutation

  sum = 0

  pandigitals.each{|num|
    if num[0] != 0
      i = 0
      property = true
      while i < 7
        if num[i+1, 3].to_s.to_i % primes[i] != 0
          property = false
          break
        end
        i += 1
      end
      if property == true
        sum += num.to_s.to_i
      end
    end
  }

  puts "The sum of all 0 to 9 pandigital numbers w/the property is:  #{sum}"

end
