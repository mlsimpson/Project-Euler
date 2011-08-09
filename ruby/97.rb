#!/usr/bin/env ruby -wKU

require "timing_method"

# The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form 2^6972593 - 1;
# it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form 2^p - 1, have been found which contain more digits.
#
# However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433 * 2^7830457 + 1.
#
# Find the last ten digits of this prime number.

# 2^700_000 takes 47 seconds.  Terribly slow.
# We only need the last 10 digits of a number.
#   => Start from there.
timing_method do

  startnum = 2

  mod = 10**10

  i = 1
  while i < 7830457
    startnum = ( (startnum * 2) % mod)
    i+=1
  end

  puts ((startnum * 28433) + 1) % mod

end

def power(a, b)
  if b.zero?
    return 1
  end
  if a.zero?
    return 0
  end
  if b.even?
    return power(a*a, b/2)
  else
    return a*power(a*a, b/2)
  end
end

timing_method do

  mod = 10000000000

  num = power(2, 7830457) % mod

  num *= 28433
  num +=1

  p num % mod

end
