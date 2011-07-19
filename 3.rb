#!/usr/bin/env ruby

require 'timing_method'

# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143?
y = ARGV[0].to_i
# Costly, but solid assumption is that the square root of the number is larger
# than the largest prime factor of the number
x = Math.sqrt(y).to_i
original = y

if y < 1
  puts "usage:  #{$0} <number to factor>"
  exit
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

timing_method do
  puts "Calculating #{x} primes..."
  @primes = sieve(x)

  y = original

  a = 0
  while y > 1
    factor = @primes[a]
    y /= factor while (y%factor).zero?
    a += 1
  end
  puts "Largest factor of #{original} is #{factor}"
end
