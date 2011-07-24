#!/usr/bin/env ruby

require 'timing_method'

# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
#
# How many routes are there through a 20x20 grid?

# It's the middle of Pascal's Triangle for a given row
#
# (m+n)!/m!n!
# =>  (2n)!/(m!n!)
timing_method do

  gridside = 20

  puts ( (1..(2*gridside)).reduce(:*) ) / ( (1..gridside).reduce(:*) * (1..gridside).reduce(:*) )

end
