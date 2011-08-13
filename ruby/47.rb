#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"
require "isPrime"

# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 * 7
# 15 = 3 * 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2² * 7 * 23
# 645 = 3 * 5 * 43
# 646 = 2 * 17 * 19.
#
# Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?
class Integer
  def prime_factors(primes)
    num = self
    i = 0
    factors = []
    while num != 1
      while num % primes[i] == 0
        factors << primes[i]
        num /= primes[i]
      end
      i += 1
    end
    factors.uniq.size
  end
end

timing_method do
  max = 150000
  primes = sieve(max / 2)
  i = 100_000
  fourfactors = []
  while i < max
    if i.isPrime? == false
      if i.prime_factors(primes) == 4
        fourfactors << i
      end
    end
    i+=1
  end

  i = 0
  while i < fourfactors.length - 3
    if fourfactors[i] == fourfactors[i+3] - 3
      p fourfactors[i]
    end
    i += 1
  end
end
# timing_method do
#   primes = sieve(100000)
#
#   four_found = false
#   n = 644
#   while four_found == false
#     p n
#     if n.num_prime_factors(primes) == 4
#       if (n+1).num_prime_factors(primes) == 4
#         if (n+2).num_prime_factors(primes) == 4
#           if (n+3).num_prime_factors(primes) == 4
#             puts "n = #{n}, num prime factors = #{n.num_prime_factors(primes)}"
#             four_found = true
#             inc = 0
#           else # n, n+1, n+2 = 4; n+3 != 4
#             inc = 4
#           end
#         else # n, n+1 = 4; n+2 != 4
#           inc = 3
#         end
#       else # n.num_prime_factors(primes) = 4; n+1 != 4
#         inc = 2
#       end
#     else # n.num_prime_factors(primes) != 4
#       inc = 1
#     end
#     n += inc
#   end
#
#   puts "The first integer in the sequence of the first four consecutive integers to have four distinct prime factors is #{n}"
#
# end
