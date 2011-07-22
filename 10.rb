#!/usr/bin/env ruby

require 'timing_method'

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

arg = 2_000_000

def sieve(x)
  s = (0..x.to_i).to_a

  s[0] = s[1] = nil

  s.each{ |p| # Perform the block for each entry in the array.
    next unless p # Iterate on next array value if entry is nil
    break if p * p > x # Cease iteration if p*p > max_value
    (p*p).step(x, p) { |m| s[m] = nil } # Starting at p*p, set every p-th value to "nil" until max_value
  }
  s = s.compact
end

timing_method do

  puts "The sum of all primes below 2,000,000 is #{sieve(arg).reduce(:+)}"

end
