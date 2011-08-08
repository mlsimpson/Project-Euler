#!/usr/bin/env ruby -wKU

require "timing_method"

# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8,
# which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

# Thoughts:
# * Numerator and Denominator are 12-98, without multiples of 10.
# - The cancelling out requirement means that the same number will appear once in both the numerator and denominator
#   at the same time.
# * Do not test any condition where the digits of the numerator or denominator are the same.
#   => This is when the numerator or denominator is divisible by 11.
# - Denominator > Numerator

# My original method
# ~ O(n^3)
timing_method do

  testvals = (12..98).select{|num| num % 10 > 0 and num % 11 > 0}
  testvals.map!{|num| num.to_f}

  numresults = []
  denresults = []

  iter = 0

  (1..9).each{|digit|
    nums = testvals.select{|val| val.to_s.chars.to_a[0].to_i == digit or val.to_s.chars.to_a[1].to_i == digit}
    nums.each{|numerator|
      nums.each{|denominator|
        if numerator < denominator
          result = numerator / denominator unless numerator == denominator
          newnumerator = numerator.to_s.chars.to_a.reject{|rejection| rejection == digit.to_s}.to_s.to_i
          newdenominator = denominator.to_s.chars.to_a.reject{|rejection| rejection == digit.to_s}.to_s.to_i
          cancelledresult = newnumerator.to_f / newdenominator.to_f
          if result == cancelledresult
            if newdenominator % newnumerator == 0
              newdenominator = (newdenominator / newnumerator)
              newnumerator = newnumerator / newnumerator
            end
            puts "#{numerator} / #{denominator} = #{newnumerator} / #{newdenominator}"
            numresults << newnumerator
            denresults << newdenominator
          end
          iter += 1
        end
      }
    }
  }

  finalnum = numresults.reduce(:*)
  finalden = denresults.reduce(:*)

  print "#{finalnum} / #{finalden} = "

  if finalden % finalnum == 0
    finalden = (finalden / finalnum)
    finalnum = finalnum / finalnum
  end

  puts "#{finalnum} / #{finalden}"
  puts "# of iterations:  #{iter}"

end

puts

# Cribbed from blog.dreamshire.com and converted from Python to Ruby
# ~ O(n^2)
# Two orders of magnitude faster than my previous version
timing_method do

  result = 1

  iter = 0

  (1...10).each{|i|
    (1...i).each{|j|
      (1...j).each{|k|
        ki = k*10 + i
        ij = i.to_f * 10 + j
        if (k*ij == ki*j)
          puts "i = #{i} =>  k = #{k}, j = #{j}, ki = #{ki}, ij = #{ij}, k*ij = #{k*ij}, ki*j = #{ki*j}"
          result *= ij/ki
          puts "ij/ki = #{ij/ki}"
        end
        iter += 1
      }
    }
  }

  p result
  puts "# of iterations:  #{iter}"
end
