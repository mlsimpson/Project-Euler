#!/usr/bin/env ruby

require 'timing_method'
require 'sum_of_proper_divisors'

# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
#
# However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

class Integer
  def isabundant?

    if sum_of_proper_divisors(self) > self
      return true
    else
      return false
    end

  end
end

# Observations:
# - Every abundant number > 24 can be written as the sum of two abundant numbers.
# - All even numbers > 48 can be written as the sum of two abundant numbers.

timing_method do

  maxnum = 20170

  allnums = (1..maxnum).to_a

  sumarray = [24, 30, 32, 36, 38, 42, 44].concat(allnums.select{|i| i if i.even? && i if i >= 48 })

  abarray = allnums.select{|i| i if i.isabundant? }
  abevens = abarray.map{|i| i if i.even? }.compact
  abodds = abarray.map{|i| i if i.odd? }.compact

  abevens.each{|abeven|
    abodds.each{|abodd|
      sumarray << abeven + abodd unless abeven + abodd > maxnum
    }
  }

  sumarray = sumarray.concat(abevens).delete_if{|i| i == 12 || i == 18 || i == 20 }.uniq

  puts "The sum of all positive integers which can not be written as the sum of two abundant numbers is #{(allnums - sumarray).reduce(:+)}"

end
