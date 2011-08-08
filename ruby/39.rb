#!/usr/bin/env ruby -wKU

require "timing_method"

# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p >= 1000, is the number of solutions maximised?

# Optimizations:
# - p (perimeter) must be even (hence the step(2) function)
# - Range of perimeter is from 500 to limit
# - a^2 + b^2 = (p-a-b)^2 since c = p-a-b
#   => after expanding & simplifying:
#   - b = p(p-2a)/2(p-a)
#   when b is an integer, it's a right triangle.
#   => p(p-2a)%2(p-a) = 0

timing_method do
  maxiter = 0
  maxval = 0

  limit = 1000

  ((limit/2)..(limit+1)).step(2){|p|
    t = 0
    (2..(p/(Math.sqrt(2) + 2)+1)).each{|a|
      if p*(p - 2*a) % (2*(p-a)) == 0
        t += 1
      end
      if t > maxiter
        maxiter, maxval = t, p
      end
    }
  }

  p maxval
end
