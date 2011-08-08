#!/usr/bin/env ruby

require 'timing_method'

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# a = 1000 - b - c
# b = 1000 - a - c
# c = 1000 - a - b
#
# c^2 = a^2 + b^2
#
# c^2 = (1000 - b - c)^2 + b^2
#
# c^2 = 2b^2+2bc-2000b+c^2-2000c+1000000
#
# c = (-b^2+1000b-500000)/(b-1000)
#
# c = (-(1000 - a - c)^2 + 1000(1000 - a - c) - 500000)/(-a - c)

s = 1000

# timing_method do
#
#   1.upto(s){|a|
#     1.upto(s){|b|
#       c = s - a - b
#       if (a**2 + b**2 == c**2)
#         puts "Product is #{a*b*c}"
#       end
#     }
#   }
# end

# timing_method do
#
#   3.upto((s-3)/3){|a|
#     a+1.upto((s-1-a)/2){|b|
#       c = s - a - b
#       if (a**2 + b**2 == c**2)
#         puts "Product is #{a*b*c}"
#       end
#     }
#   }
# end

def gcd(a, b)
  while b != 0
    t = b
    b = (a%b)
    a = t
  end
  a
end

# I have no idea how this works.
# http://projecteuler.net/project/resources/009_5afd54de06d8664fadfde1889d8943ab/009_overview.pdf
timing_method do
  s2 = s / 2
  mlimit = Math.sqrt(s2).abs.to_i - 1

  m = 2
  while m < mlimit
    if (s2%m).zero?
      sm = s2 / m
      while (sm%m).zero?
        sm /= 2
      end
      if (m%2) == 1
        k = m+2
      else
        k = m+1
      end
      while k < 2*m && k <= sm
        if (sm%k).zero? && gcd(k,m) ==1
          d = s2 / (k*m)
          n = k-m
          a = d*(m*m-n*n)
          b = 2*d*m*n
          c = d*(m*m+n*n)
          puts "Product is #{a*b*c}"
        end
        k += 2
      end
    end
    m += 1
  end
end
