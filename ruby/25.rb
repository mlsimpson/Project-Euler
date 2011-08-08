#!/usr/bin/env ruby

require 'timing_method'

# What is the first term in the Fibonacci sequence to contain 1000 digits?

timing_method do

  termnum = 1
  i, j = 0, 1
  while j.to_s.length < 1000
    i, j = j, i + j
    termnum += 1
  end

  puts termnum

end
