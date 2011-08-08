#!/usr/bin/env ruby

require 'timing_method'

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

#####
# This is totally unnecessary
#####
# def isPalindrome?(num)
#   num = num.to_s
#
#   ispal = true
#
#   i = 0
#   j = num.length - 1
#
#   while i < num.length / 2
#     num[i] == num[j] ? nil : ispal = false
#     break if ispal == false
#     i += 1
#     j -= 1
#   end
#   ispal
# end

def isPalindrome?(num)
  num.to_s == num.to_s.reverse
end

# # Copied and modified from web
# # http://johnnycoder.com/blog/2010/07/05/project-euler-4-ruby/
# timing_method do
#   max = 0
#   999.downto(100) { |x|
#     x.downto(100) { |y|
#       result = x * y
#       if isPalindrome?(result) && result > max
#         max = result
#       end
#     }
#   }
#
#   puts "#{max} is the largest palindrome made from 3-digit numbers"
# end

# Faster version from Project Euler's notes
#
# Consider the digits of P.
# Let them be x, y and z.
# P must be at least 6 digits long since the palindrome
# 111111 = 143×777 – the product of two 3-digit integers.
# Since P is palindromic:
#
# P = 100000x + 10000y + 1000z + 100z + 10y + x
# P = 100001x + 10010y + 1100z
# P = 11(9091x + 910y + 100z)
#
# Since 11 is prime, at least one of the integers a or b must have a factor of 11.
# So if a is not divisible by 11 then we know b must be.
# Using this information we can determine what values of b we check depending on a:

# Sweet jesus, this is hella fast.
timing_method do
  a = 999
  max = 0

  while a >= 100
    if (a%11).zero?
      b = 999
      db = 1
    else
      b = 990 # Largest number <= 999 and divisible by 11
      db = 11
    end

    while b >= a
      result = a*b
      break if result <= max
      # This is where is shaves off a fuckload of time
      # If the result is less than the current maximum, skip it.

      if isPalindrome?(result)
        max = result
      end
      b = b-db
    end

    a -= 1
  end

  puts "#{max} is the largest palindrome made from 3-digit numbers"
end
