#!/usr/bin/env ruby -wKU

require "timing_method"
require "isPrime"

# What is the side length of the square spiral for which the ratio of primes
# along both diagonals first falls below 10%?

# Side starts at 1, increases by 2 each time.
# Total numbers along diagonals start at 1, increases by 4 each time.
timing_method do

  layer = 1
  sidelength = 3
  num = 1
  numdiags = 5
  numprimes = 0
  while true
    i = 0
    while i < 4
      num += layer * 2
      if num.isPrime?
        numprimes += 1
      end
      i += 1
    end
    if numprimes.to_f / numdiags.to_f < 0.1
      break
    end
    sidelength += 2
    layer += 1
    numdiags += 4
  end

  puts "numprimes = #{numprimes}, numdiags = #{numdiags}, num = #{num}"

  p sidelength

end
