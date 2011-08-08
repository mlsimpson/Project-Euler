#!/usr/bin/env ruby

require 'timing_method'

# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

max = 1_000_000_000

# First brute force attempt.
# Looks all great and ruby-like
# Doesn't scale well to values > 10^6
#
# http://projecteuler.net/project/resources/006_8ff3854d43f923db0942e2ce73b1be0b/006_overview.pdf
# is wicked fast.
timing_method do
  # Sum of squares
  # sumsqr = (1..max).inject(0){|sum, n|
  #   sum += n**2
  #   sum
  # }

  # sumsqr = n(2n+1)(n+1)/6
  sumsqr = ((2*max+1)*(max+1)*max)/6

  # Square of sums
  # sqrsum = (1..max).reduce(:+)**2
  #
  # Note:  sum(n) = (n*(n+1))/2
  sqrsum = (0.5*max*(max+1)).to_i**2

  print "Difference between the Square of the Sum and Sum of the Squares of the first #{max} natural numbers is:  "
  puts (sqrsum - sumsqr)
end
