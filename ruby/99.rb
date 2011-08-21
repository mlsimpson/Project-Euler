#!/usr/bin/env ruby -wKU

require "timing_method"

# Compute the largest base/exponent pair in base_exp.txt, and return the line number.
#
# if x^a > y^b, log(x)^a > log(y)^b

timing_method do
  data = File.new("base_exp.txt")

  lines = data.map{|line|
    line.chomp.split(',').map{|x| x.to_i}
  }

  linenum = 1
  maxline = 0
  max = 0
  lines.each{|line|
    result = (Math.log10(line[0]))*line[1]
    if result > max
      maxline = linenum
      max = result
    end
    linenum += 1
  }

  puts maxline

end
