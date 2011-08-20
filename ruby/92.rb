#!/usr/bin/env ruby -wKU

require "timing_method"
require "rubygems"
require "awesome_print"

# Investigate strange squaring property

# Hash is necessary to memoize this.
timing_method do
  sumhash = Hash.new(0)

  max = 10_000_000

  total = 0

  max.downto(1){|n|
    temp = n
    to89 = false
    broken = false
    temparray = []
    # temparray << n unless n > 567 # Max sum of digits^2 is 567 (9_999_999.inject yadda yadda = 567)
    while broken == false
      if temp < 10
        temp *= temp
        # temparray << temp
      else
        temp2 = temp.to_s.chars.to_a.map{|digit| digit.to_i}
        temp = temp2.inject(0){|sum, digit|
          sum += digit**2
        }
        # temparray << temp
      end
      if sumhash.key?(temp)
        broken = true
        if sumhash[temp]
          total += 1
          temparray.each{|num|
            sumhash[num] = true
          }
        else
          temparray.each{|num|
            sumhash[num] = false
          }
        end
      else
        temparray << temp
        if temp == 1
          temparray.each{|num|
            sumhash[num] = false
          }
          broken = true
        elsif temp == 89
          temparray.each{|num|
            sumhash[num] = true
          }
          total += 1
          broken = true
        else
          nil
        end
      end
    end
  }

  ap total
end
