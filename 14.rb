#!/usr/bin/env ruby

require 'timing_method'

# The following iterative sequence is defined for the set of positive integers:
#
# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

# If a sequence contains a number, then anything after that number is the sequence for that number.
#
# Create a caching (aka "memoization") structure that contains the length for each number.
timing_method do

  limit = 1_000_000

  i = 2
  memo_hash = Hash.new(0)

  maxcount = 0
  maxnum = 0

  while i <= limit
    count = 1
    temp_i = i

    # puts "#{i}:"
    # print "#{i} "

    has_num = false

    while temp_i > 1 && has_num == false
      if memo_hash.include?(temp_i)
        # puts "memo_hash[#{temp_i}] = #{memo_hash[temp_i]}"
        memo_hash[i] = count + memo_hash[temp_i] - 1
        has_num = true
      else
        temp_i.even? ? temp_i /= 2 : temp_i = 3*(temp_i) + 1
        count += 1 # Length of chain
        # print "#{temp_i} "
      end
    end

    has_num == false ? memo_hash[i] = count : nil

    if memo_hash[i] > maxcount
      maxcount = memo_hash[i]
      maxnum = i
    end

    # puts
    i += 1
    # puts
  end

  puts "The number under #{limit} that has the longest chain is #{maxnum}"

end
