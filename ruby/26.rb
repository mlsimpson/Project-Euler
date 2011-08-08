#!/usr/bin/env ruby

require 'timing_method'
require 'sieve'

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

timing_method do

  maxnum = 1000
  precision = 1000
  comparesize = 6
  max = 0

  maxperiod = 0

  primes = sieve(maxnum) - [2, 5]

  primes.each{|prime|
    # puts "prime = #{prime}"
    digits = Array.new
    index = 0
    x = 1
    while index < precision
      digits << (x*10) / prime
      x = (x*10)%prime
      index +=1
    end

    # puts "0.#{digits}"

    start = digits[0..comparesize - 1]

    index = comparesize
    originalindex = index

    while start != digits[index, comparesize]
      index += 1
    end

    if index > maxperiod
      maxperiod = index
      max = prime
    end
  }

  puts max

end
