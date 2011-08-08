#!/usr/bin/env ruby

require 'timing_method'

# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

timing_method do

  sum = 1
  val = 1
  size = 1001
  iter = 1

  while iter <= (size / 2)
    i = 0
    while i < 4
      val += (iter*2)
      sum += val
      i += 1
    end
    iter += 1
  end

  puts "The sum of the numbers on the diagonals in a #{size} by #{size} spiral is #{sum}."

end

timing_method do

  size = 1001
  sum = 1

  (3..size).step(2){|n|
    nsq = n**2

    sum += nsq + (nsq - n + 1) + (nsq - 2*n + 2) + (nsq - 3*n + 3)
  }

  puts "The sum of the numbers on the diagonals in a #{size} by #{size} spiral is #{sum}."
end

timing_method do

  size = 1001
  sum = 1

  (3..size).step(2){|n|
    sum += (4*n*n) - 6*n + 6
  }

  puts "The sum of the numbers on the diagonals in a #{size} by #{size} spiral is #{sum}."

end

# You all worked your computers too hard.
# For a 2n+1 by 2n+1 square, the sum of the diagonals is
# 8n(n+1)(2n+1)/3 + 2n(n+1) + 4n + 1
# Substitute n=1001, and do it with pencil and paper.
timing_method do

  #2n+1 = 1001 ::> n = 500

  realsize = 500
  size = 2*realsize + 1

  sum = 8*realsize*(realsize + 1)*((2*realsize) + 1)/3 + 2*realsize*(realsize + 1) + 4*realsize + 1

  puts "The sum of the numbers on the diagonals in a #{size} by #{size} spiral is #{sum}."

end
