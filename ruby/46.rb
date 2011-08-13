#!/usr/bin/env ruby -wKU

require "timing_method"
require "isPrime"

# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

timing_method do
  max = 100

  twice_squares = []
  (1..max).each{|num|
    twice_squares << 2 * (num**2)
  }

  i = 33

  found = false
  while true
    if i.isPrime? == false
      n = 0
      while twice_squares[n] < i
        if (i - twice_squares[n]).isPrime?
          # puts "#{i} is the sum of #{i - twice_squares[n]} and #{twice_squares[n]}."
          break
        else
          n += 1
        end
      end
      if twice_squares[n] > i
        found = true
        break
      end
    end
    i += 2
  end

  p i

end
