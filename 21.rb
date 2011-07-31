#!/usr/bin/env ruby

require 'timing_method'

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

# def find_divisors2(num)
#
#   square_root = Math.sqrt(num)
#
#   div_array = [1]
#
#   2.upto(square_root.to_i){|n|
#     if (num % n).zero?
#       div_array << n
#       div_array << (num / n)
#     end
#   }
#
#   div_array
#
# end

# timing_method do
#
#   maxnum = 10000
#
#   max_amicable = 0
#
#   a1 = 2
#
#   amicable_array = Array.new
#
#   tested_numbers = Array.new
#
#   ami_sum = 0
#
#   while true
#     if tested_numbers.include?(a1) == false
#       a2 = find_divisors2(a1).reduce(:+)
#       if find_divisors2(a2).reduce(:+) == a1 and a2 != a1
#         max_amicable = [a1, a2].max
#         if max_amicable > maxnum
#           break
#         end
#         puts "#{a1} and #{a2} are amicable pairs"
#         amicable_array << a1
#         amicable_array << a2
#       end
#       tested_numbers << a1
#       tested_numbers << a2
#     end
#     a1 += 1
#   end
#
#   puts "Sum of amicable pairs up to #{maxnum} is #{amicable_array.reduce(:+)}"
#
# end
#
# puts
# puts "The following method is much, much faster."
# puts

def sum_of_divisors(num)

  if num == 1
    return 0
  end

  root = Math.sqrt(num).to_i

  if root**2 == num
    sum = 1+root
    root -= 1
  else
    sum = 1
  end

  if num.odd?
    f = 3
    stepnum = 2
  else
    f = 2
    stepnum = 1
  end

  (f..root).step(stepnum){|i|
    if(num % i == 0)
      sum += i
      sum += (num / i)
    end
  }

  sum

end

# Using prime factorization rules
# See http://projecteuler.net/project/resources/021_f0a1663c39561832c22743f7fde31ab9/021_overview.pdf
def sum_of_divisors2(num)

  if num == 1
    return 0
  end

  sum = 1
  p = 2
  while p*p <= num && num > 1
    if (num%p).zero?
      j = p*p
      num = (num / p)
      while (num%p).zero?
        j = j*p
        num = (num / p)
      end
      sum = sum*(j-1)
      sum = sum / (p-1)
    else
    end
    if p == 2
      p = 3
    else
      p = p+2
    end
  end

  if num > 1
    sum = sum * (num+1)
  end

  sum
end

timing_method do

  sum = 0

  maxnum = 10000

  1.upto(maxnum){|i|
    x = sum_of_divisors(i)
    if x > i # Saves time, see http://projecteuler.net/project/resources/021_f0a1663c39561832c22743f7fde31ab9/021_overview.pdf
      if(sum_of_divisors(x) == i)
        if(i != x)
            puts "#{i} and #{x} are amicable pairs"
            sum += i + x
        end
      end
    end
  }

  puts "Sum of amicable pairs up to #{maxnum} is #{sum}"

end

puts

timing_method do

  sum = 0

  maxnum = 10000

  1.upto(maxnum){|i|
    x = (sum_of_divisors2(i) - i)
    if x > i # Saves time, see http://projecteuler.net/project/resources/021_f0a1663c39561832c22743f7fde31ab9/021_overview.pdf
      if((sum_of_divisors2(x) - x) == i)
        if(i != x)
            puts "#{i} and #{x} are amicable pairs"
            sum += i + x
        end
      end
    end
  }

  puts "Sum of amicable pairs up to #{maxnum} is #{sum}"

end
