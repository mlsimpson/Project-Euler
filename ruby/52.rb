#!/usr/bin/env ruby -wKU

require "timing_method"

# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

timing_method do

  x = 100
  found = false
  while found == false
    i = x
    y = x + ((2*x) / 3)
    while i <= y
      digits = i.to_s.chars.sort
      if (i * 2).to_s.chars.sort == digits
        if (i * 3).to_s.chars.sort == digits
          if (i * 4).to_s.chars.sort == digits
            if (i * 5).to_s.chars.sort == digits
              if (i * 6).to_s.chars.sort == digits
                found = true
                break
              end
            end
          end
        end
      end
      i += 1
    end
    x *= 10
  end

  puts "The smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x contain the same digits is #{i}."
end
