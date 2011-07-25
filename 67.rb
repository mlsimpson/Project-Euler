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

  # puts [rows[0][0] + rows[1][0], rows[0][0] + rows[1][1]].max

  # i = 0
  # rows[rows.length - 1].inject(0){|max, value|
  #   p "value = #{value}, rows[rows.length - 2][i] = #{rows[rows.length - 2][i]}, rows[rows.length - 2][i-1] = #{rows[rows.length - 2][i-1]}"
  #   p [value+rows[rows.length - 2][i], value+rows[rows.length - 2][i-1]].max
  #   p "i = #{i}"
  #   i += 1
  # }

  (rows.length - 1).downto(0){|rownum|
    0.upto(rownum - 1){|value|
      rows[rownum - 1][value] += [rows[rownum][value], rows[rownum][value+1]].max
    }
  }

  p rows[0][0]
end
