#!/usr/bin/env ruby -wKU

require "timing_method"

# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?

timing_method do
  total = 0

  i = 1
  nomore = false
  while nomore == false
    runningtotal = 0
    (1..9).each{|n|
      if (n**i).to_s.length == i
        puts "#{n}^#{i} = #{n**i}"
        runningtotal += 1
        total += 1
      end
    }
    if runningtotal == 0
      nomore = true
    end
    i += 1
  end

  puts "The total is: #{total}."
end
