#!/usr/bin/env ruby

require 'timing_method'

# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

timing_method do

  limit = 1_000_000

  sum = 0

  (1..limit).each{|n|
    if n.odd?
      if n.to_s == n.to_s.reverse
        bin = n.to_s(2)
        if bin == bin.reverse
          puts "#{n}, #{bin}"
          sum += n
        end
      end
    end
  }

  puts "The sum of all numbers, less than #{limit}, which are palindromic in base 10 and base 2 is #{sum}."

end
