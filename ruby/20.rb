#!/usr/bin/env ruby

require 'timing_method'

# Find the sum of the digits in the number 100!

timing_method do
  puts (1..100).inject(:*).to_s.split('').map!{|char| char.to_i}.inject(:+)
end
