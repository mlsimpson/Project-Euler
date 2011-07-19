#!/usr/bin/env ruby

require 'timing_method'

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

# Terribly inefficient to calculate way more primes than I need.
timing_method do
  x = 200_000
  puts "Calculating primes up to #{x}..."
  primes = sieve(x)

  puts "The 10001st prime number is #{primes[10001-1]}" # The trailing -1 makes up for the 0th indexing of the Array

end
