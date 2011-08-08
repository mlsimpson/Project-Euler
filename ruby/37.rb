#!/usr/bin/env ruby -wKU

require "timing_method"

# The number 3797 has an interesting property.
# Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7.
# Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not conumsidered to be truncatable primes.

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

# Any prime > 3 can be represented as:
# 6n (+/-) 1
#
# Useful!
class Integer
  def isPrime?
    if self < 1
      return false
    elsif self == 1
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
    end
    if self > 0
      return true
    else
      return false
    end
  end
end

timing_method do
  primes = sieve(740_000)

  nums = []

  primes.each{|prime|
    if prime > 7
      primestr = prime.to_s
      primetrunc = true

      i = 1
      while i < primestr.length && primetrunc == true
        if primestr[i..-1].to_i.isPrime? == false
          primetrunc = false
        end
        i += 1
      end

      i = -2
      while (i + primestr.length + 1) > 0 && primetrunc == true
        if primestr[0..i].to_i.isPrime? == false
          primetrunc = false
        end
        i -= 1
      end

      if primetrunc == true
        nums << prime
      end
    end
  }

  p nums.reduce(:+)

end
