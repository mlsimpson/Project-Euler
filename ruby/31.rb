#!/usr/bin/env ruby -wKU

require "timing_method"

# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
#
# 1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
# How many different ways can £2 be made using any number of coins?

# This is an integer partitions problem.
# http://en.wikipedia.org/wiki/Integer_partition
class Integer
  def integer_partitions(values, i=0)
    # puts "Number is #{self}, values[i] = #{values[i]}, i = #{i}"
    if i == values.length-1
      # puts "  Popping off stack; return val = 1"
      1
    else
      # self >= 0 ? (self - values[i]).integer_partitions(values, i) + self.integer_partitions(values, i+1) : 0
      if self >= 0
        # puts "  Recursing:  Adding #{self}, #{i} to recursion stack."
        (self - values[i]).integer_partitions(values, i) + self.integer_partitions(values, i+1)
      else
        # puts "  Popping off stack; #{self} < 0; return val = 0"
        0
      end
    end
  end
end

timing_method do
  coins = [200, 100, 50, 20, 10, 5, 2, 1]
  # coins = [200, 100, 50]

  p coins[0].integer_partitions(coins)

end

# Dynamic programming solution:

timing_method do
  coins = [200, 100, 50, 20, 10, 5, 2, 1]

  ways = [1] + Array.new(coins[0], 0)

  coins.each{|coin|
    i = coin
    while i < (coins[0] + 1)
      ways[i] += ways[i-coin]
      i += 1
    end
  }

  p ways
  p ways[coins[0]]

end
