#!/usr/bin/env ruby -wKU

require 'timing_method'
require "rubygems"
require "awesome_print"
require "sieve"
require "isPrime"
# By replacing the 1st digit of *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit,
# this 5-digit number is the first example having seven primes among the ten generated numbers,
# yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993.
# Consequently 56003, being the first member of this family, is the smallest prime with this property.
#
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.)

timing_method do
  primes = sieve(1_000_000)

  sixdigits = primes.reject{|number| number < 100_000 }.map{|num| num.to_s }

  found = false

  (0..9).each{|digit|
    if found == true
      break
    end
    strdig = digit.to_s
    sixdigits.each{|num|
      if num.count(strdig) == 3 && found == false
        if found == true
          break
        end
        count = 0
        (digit..9).each{|replace|
          if found == true
            break
          end
          strrep = replace.to_s
          newnum = num.gsub(strdig, strrep)
          if newnum.to_i.isPrime?
            count += 1
            if count == 8
              ap num.to_i
              found = true
            end
          end
        }
      end
    }
  }
end
