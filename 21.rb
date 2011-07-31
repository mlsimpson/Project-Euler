#!/usr/bin/env ruby

require 'timing_method'

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

def find_divisors2(num)

  square_root = Math.sqrt(num)

  # div_array = [1]

  # 2.upto(square_root.to_i){|n|
  #   if (num % n).zero?
  #     div_array << n
  #     div_array << (num / n)
  #   end
  # }

  # div_array

  sum = 1
  2.upto(square_root.to_i){|n|
    if(num%n).zero?
      sum += n + (num / n)
    end
  }

  sum

end

timing_method do

  maxnum = 10000

  max_amicable = 0

  a1 = 2

  amicable_array = Array.new

  tested_numbers = Array.new

  ami_sum = 0

  while true
    if tested_numbers.include?(a1) == false
      # a2 = find_divisors2(a1).reduce(:+)
      a2 = find_divisors2(a1)
      #if find_divisors2(a2).reduce(:+) == a1 and a2 != a1
      if find_divisors2(a2) == a1 and a2 != a1
        max_amicable = [a1, a2].max
        if max_amicable > maxnum
          break
        end
        puts "#{a1} and #{a2} are amicable pairs"
        ami_sum += a1 + a2
        # amicable_array << a1
        # amicable_array << a2
      end
      tested_numbers << a1
      tested_numbers << a2
    end
    a1 += 1
  end

  # puts "Sum of amicable pairs up to #{maxnum} is #{amicable_array.reduce(:+)}"
  puts "Sum of amicable pairs up to #{maxnum} is #{ami_sum}"

end

puts
puts "The following method is much, much faster."
puts

def sum_of_divisors(num)

  sum = 1
  2.upto(Math.sqrt(num).to_i + 1){|i|
    if(num % i == 0)
      sum += i
      sum += (num / i)
    end
  }

  sum

end

timing_method do

  sum = 0

  maxnum = 10000

  tested = Array.new

  1.upto(maxnum){|i|
    x = sum_of_divisors(i)
    if(sum_of_divisors(x) == i)
      if(i != x)
        if tested.include?(i) == false
          puts "#{i} and #{x} are amicable pairs"
          sum += i + x
          tested << i
          tested << x
        end
      end
    end
  }

  puts "Sum of amicable pairs up to #{maxnum} is #{sum}"

end
