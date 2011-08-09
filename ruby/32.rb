#!/usr/bin/env ruby -wKU

require "timing_method"

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

# There must only be 9 digits in the multiplicand, multiplier, and product.
# => lowest possible is:  12 * 345
#   => since no product of 2 digit numbers results in a 5 digit number.
# => highest possible is 12 * 789
#   => since no higher 3 digit number results in a 4 digit number.
# => Consider 1 digit * 4 digit:
#   => highest possible is:  2 * 4987
#     :: from tests, ones digit can ONLY be 4, and max val is 1963.
#
# Optimizations of digit arrays based on testing, shaved total computation time significantly.
timing_method do

  products = []

  # onedigit = (1..9).to_a
  onedigit = "4".to_a

  twodigits = (1..9).to_a.permutation(2).to_a.reject{|array| array.to_s.to_i > 48 }

  threedigits = (1..9).to_a.permutation(3).to_a.reject{|array| array.to_s.to_i > 483 }

  fourdigits = (1..9).to_a.permutation(4).to_a.reject{|array| array.to_s.to_i > 1963 }

  # one digit * four digits
  onedigit.each{|digit|
    fourdigits.each{|digits4|
      if (digit.to_s.to_i * digits4.to_s.to_i).to_s.length <= 4
        product = digit.to_s.to_i * digits4.to_s.to_i
        productdigits = product.to_s.chars.to_a.sort
        if productdigits.include?("0") == false
          finaldigits = (product.to_s.chars.to_a + digit.to_s.to_a + digits4.to_s.chars.to_a)
          if finaldigits.uniq! == nil
            p finaldigits.sort
            puts "  #{digit} * #{digits4} = #{product}"
            products << product
          end
        end
      end
    }
  }

  # two digits * three digits
  twodigits.each{|digit|
    threedigits.each{|digits4|
      if (digit.to_s.to_i * digits4.to_s.to_i).to_s.length <= 4
        product = digit.to_s.to_i * digits4.to_s.to_i
        productdigits = product.to_s.chars.to_a.sort
        if productdigits.include?("0") == false
          finaldigits = (product.to_s.chars.to_a + digit.to_s.chars.to_a + digits4.to_s.chars.to_a)
          if finaldigits.uniq! == nil
            p finaldigits.sort
            puts "  #{digit} * #{digits4} = #{product}"
            products << product
          end
        end
      end
    }
  }

  products.uniq!

  puts "The sum of products whose multiplicative/multiplier/product identity is pandigital from 1-9 is #{products.reduce(:+)}."
end
