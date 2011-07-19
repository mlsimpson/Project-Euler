#!/usr/bin/env ruby

require 'timing_method'

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def gcd(a, b)
  while b != 0
    t = b
    b = (a%b)
    a = t
  end
  a
end

# lcm = product of x*y divided by the gcd of x & y
def lcm(x, y)
  (x*y) / gcd(x, y)
end


def sieve(x)
  s = (0..x.to_i).to_a
  s[0] = s[1] = nil
  s.each{ |p| # Perform the block for each entry in the array.
    next unless p # Iterate on next array value if entry is nil
    break if p * p > x # Cease iteration if p*p > max_value
    (p*p).step(x, p) { |m| s[m] = nil } # Starting at p*p, set every p-th value to "nil" until max_value
  }
  s.compact # Removes all nil entries and returns the compacted array.
end

# My personal method
timing_method do
  result = 1
  a = 1

  max = 20

  # (1..max).each would also work.
  (1..max).each{|i|
    result = lcm(i, result)
  }

  puts "The least common multiple of all numbers up to #{max} is #{result}"
end
