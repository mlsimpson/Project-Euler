#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"
require "isPrime"

# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways:
# (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?

timing_method do

  primes = sieve(10_000).reject!{|prime| prime < 1000}

  primes.each{|prime|
    next if prime == 1487
    break if prime > 3307

    prime2 = prime + 3330
    prime3 = prime + 6660

    if primes.include?(prime2)
      primedigits = prime.to_s.chars.to_a.sort
      if prime2.to_s.chars.to_a.sort == primedigits
        if primes.include?(prime3)
          if prime3.to_s.chars.to_a.sort == primedigits
            puts "#{prime}#{prime2}#{prime3}"
          end
        end
      end
    end

  }
end
