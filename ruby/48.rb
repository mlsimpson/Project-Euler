#!/usr/bin/env ruby

require 'timing_method'

# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

timing_method do

  puts "The last ten digits of the series n^n for (1..1000) are #{(1..1000).inject(0){|sum, val|
    sum += val**val
    sum
  }.to_s[-10..-1]}"

end
