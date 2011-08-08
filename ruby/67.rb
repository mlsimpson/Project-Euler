#!/usr/bin/env ruby

require 'timing_method'

# This is Problem 18 with a much larger dataset

timing_method do

  data = File.new("triangle.txt")

  # Separate each row into its own array of distinct numbers (currently strings)
  rows = data.map{|str|
    str.chomp.split.map{|x| x.to_i}
  }

  data.close

  (rows.length - 1).downto(0){|rownum|
    0.upto(rownum - 1){|value|
      rows[rownum - 1][value] += [rows[rownum][value], rows[rownum][value+1]].max
    }
  }

  p rows[0][0]
end
