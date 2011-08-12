#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"
require "isPrime"

# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

timing_method do
  primes = sieve(4000)

  primesums = []
  primes.inject(0){|sum, val|
    sum += val
    primesums << sum
    sum
  }

  maxprime = 0

  terms = 0
  i = 0
  while i < primesums.length - 1
    j = i + terms
    while j < primesums.length - 1
      num = primesums[j] - primesums[i]
      if num.isPrime?
        if (j - i) > terms
          if num < 1_000_000
            maxprime = num
            terms = (j - i)
          end
        end
      end
      j += 1
    end
    i += 1
  end

  puts "The prime below 1,000,000 that can be written as the sum of the most consecutive primes is #{maxprime}, with #{terms} terms."
end
