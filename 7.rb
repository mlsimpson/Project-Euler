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

class Integer
  def isPrime?
    if self == 1
      return false
    elsif self < 4
      return true
    elsif self % 2 == 0
      return false
    elsif self < 9
      return true
    elsif self % 3 == 0
      return false
    else
      r = Math.sqrt(self).floor
      f = 5
      while f <= r
        if self % f == 0
          return false
        end
        if self % (f + 2) == 0
          return false
        end
        f += 6
      end
      return true
    end
  end
end

# What is the 10001st Prime Number?

# Terribly inefficient to calculate way more primes than I need.
timing_method do
  x = 200_000
  puts "Calculating primes up to #{x}..."
  primes = sieve(x)

  puts "The 10001st prime number is #{primes[10001-1]}" # The trailing -1 makes up for the 0th indexing of the Array

end

# This is actually a lot slower than the sieve
timing_method do

  num = 10001

  count = 1
  a = 1
  while true
    a += 2
    a.isPrime? ? count += 1 : nil
    break if count == num
  end

  puts "The #{num} prime number is #{a}"

end
