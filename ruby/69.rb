#!/usr/bin/env ruby -wKU

require "timing_method"
require "sieve"

# Find the value of n <= 1_000_000 for which n/totient(n) is a maximum.

# Let's call Euler's function `Phi'. `p' is any prime number and a,b,n any positive numbers:
#
# Phi(p) = p-1
# Phi(p^n) = (p-1)*p^(n-1)
# Phi(a*b) = Phi(a)*Phi(b) if gcd(a,b)=1
#
# So to evaluate Phi for any number, write it as a product of powers of primes and do this:
# Phi(p1^n1 * p2^n2 * p3^n3 * ... *pk^nk) = (p1-1)*p1^(n1-1) * (p2-1)*p2^(n2-1) * ... * (pk-1)*pk^(nk-1)
#
# See Problem 12
# timing_method do
#   # Divisor Algorithm:
#   # - Create sieve first of arbitrary size
#   # - For each prime number:
#   #   => Check if given prime is a factor of n
#   #       if n%prime[x] == 0
#   #           => Repeatedly divide n by prime
#   #           => Add 1 to exp_count
#   #           => Cease when n%prime[x] !=0 OR n == 0
#   #           Put # of occurrences in each prime into an array.
#   #       else
#   #           => Iterate through prime
#   #       end
#   limit = 1_000_000
#   primes = sieve(limit)
#   max = 0
#   maxval = 0
#
#   (2..limit).each{|n|
#     n_test = n
#     exp_count = 0
#
#     factors = Array.new # Array of factors
#     exponents = Array.new # Array of exponents
#     m = 0 # Index for primes array
#
#     while n_test > 1
#       if (n_test%primes[m]) == 0
#         factors << primes[m] unless factors.include?(primes[m])
#         exp_count += 1
#         n_test = (n_test / primes[m])
#         if n_test == 1 # Number is divisible by itself.
#           exponents << exp_count
#         end
#       else
#         exp_count > 0 ? exponents << exp_count : nil
#         exp_count = 0 # Reset exp_count
#         m += 1 # Iterate to next prime
#       end
#     end
#
#     i = 0
#     prod = 1
#     while i < factors.length
#       prod *= (factors[i] - 1)*(factors[i]**(exponents[i] - 1))
#       i += 1
#     end
#
#     ntotn = n.to_f / prod.to_f
#
#     if ntotn > max
#       max = ntotn
#       maxval = n
#     end
#
#     # puts "#{n}:  totient = #{prod}, n/totient = #{ntotn}, total max is #{max}.  Largest n/totent so far is #{maxval}" if n%100 == 0
#
#   }
#
#   puts "Max val of n is #{maxval}"
#
# end

# The above is waayaaayayayayayayay too slow.
# Upon further research, the more prime numbers that are a factor of a number, the less the totient number.
# So, find the highest number < limit that has the largest amount of "small" prime numbers
# => think about it this way:  any multiple of a small prime is not coprime; therefore it could be counted in totient.

timing_method do
  primes = sieve(100);

  i = 0
  num = 1

  limit = 1_000_000

  while i < primes.length
    num *= primes[i] unless num * primes[i] > limit
    i += 1
  end

  p num
end
