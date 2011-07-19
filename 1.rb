#!/usr/bin/env ruby

require 'timing_method'

# This is woefully inefficient.
#
# def adding_function
#   puts (1...1000).select{|i|
#     i %3 == 0 || i %5 == 0
#   }.reduce(:+)
# end
#
# timing_method do
#   adding_function
# end

#
# Let’s look at the details of our function and take as example n=3.
# We would have to add:
# 3+6+9+12+......+999=3*(1+2+3+4+...+333)
# For n=5 we would get:
# 5+10+15+...+995=5*(1+2+....+199)
# Now note that 199=995/5 but also 999/5 rounded down to the nearest integer.
# In many programming languages there exists a separate operator for that: div or \.
# If we now also note that 1+2+3+...+p=½*p*(p+1)  our program becomes:
#
max = ARGV[2].to_i - 1
val1 = ARGV[0].to_i
val2 = ARGV[1].to_i

def SumDivisibleByN(n, max)
  p = max / n
  (n*(p*(p+1)))/ 2
end

# http://en.wikipedia.org/wiki/Euclidean_algorithm
def gcd(a, b)
  while b != 0
    t = b
    b = (a%b)
    a = t
  end
  a
end

# lcm = product of x*y divided by the gcd of x & y
def lcm(x, y)
  (x*y) / gcd(x, y)
end

# This is crazy fast.
timing_method do
text = <<CUT
Add all the natural numbers below maximum number that are multiples of val1 or val2.
CUT
  if max >= 0
    puts SumDivisibleByN(val1, max) + SumDivisibleByN(val2, max) - SumDivisibleByN(lcm(val1, val2), max)
    # The last part of the previous equation should be the least common multiple
    # Int.lcm works only in ruby 1.9
    # puts SumDivisibleByN(val1, max) + SumDivisibleByN(val2, max) - SumDivisibleByN(val1.lcm(val2), max)
  else
    puts text
    print "usage:  #{$0} <first divisor> <second divisor> <maximum number>\n"
    exit
  end
end
