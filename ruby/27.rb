#!/usr/bin/env ruby

require 'timing_method'
require 'isPrime'
require 'sieve'

# Considering quadratics of the form:
#
# n² + an + b, where |a| = 1000 and |b| = 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n,
# starting with n = 0.

# Optimizations:
# - b must be prime:  0² +a*0 + b == prime ::>  b == prime
# - a must be odd to generate the most primes
timing_method do

  atest = (-1000..1000).to_a.select{|a| a if a.odd? }
  btest = sieve(1000)

  max = 0
  maxprod = 0
  maxvals = Array.new

  atest.each{|a|
    btest.each{|b|
      n = 0
      while true
        if ((n**2) + (a*n) + b).isPrime?
          n += 1
        else
          break
        end
      end
      if n > max
        max = n
        maxprod = a * b
        maxvals = [a, b]
      end
    }
  }

  puts "The product of the coefficients a and b for the quadratic expression that produces the max number of primes for consecutive values of n is #{maxprod}"

end
