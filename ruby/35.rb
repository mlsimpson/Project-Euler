#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"
require "isPrime"

# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

class Integer
  def rotate(iters)
    i = 0
    selfcopy = self.to_s.chars.to_a
    while i < iters
      char1 = selfcopy.slice!(0)
      selfcopy.push(char1)
      i += 1
    end
    selfcopy.to_s.to_i
  end
end

timing_method do

  limit = 1_000_000
  numcircular = 0

  primes = sieve(limit)

  primes.each{|prime|
    isCircular = true
    i = 1
    while i < prime.to_s.length
      unless prime.rotate(i).isPrime?
        isCircular = false
        break
      end
      i += 1
    end
    if isCircular == true
      numcircular += 1
    end
  }

  puts "The number of circular primes below #{limit} is #{numcircular}."

end
