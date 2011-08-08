#!/usr/bin/env ruby

require 'timing_method'

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

# Unique Instances of Letter Combinations
# =======================================
# one = 3
# two = 3
# three = 5
# four = 4
# five = 4
# six = 3
# seven = 5
# eight = 5
# nine = 4
# ten = 3
# eleven = 6
# twelve = 6
# thirteen = 8
# fourteen = 8
# fifteen = 7
# sixteen = 7
# seventeen = 9
# eighteen =8
# nineteen = 8
# twenty = 6
# thirty = 6
# forty = 5
# fifty = 5
# sixty = 5
# seventy = 7
# eighty = 6
# ninety = 6

digit_hash = {1=>3, 2=>3, 3=>5, 4=>4, 5=>4, 6=>3, 7=>5, 8=>5, 9=>4, 10=>3, 11=>6, 12=>6, 13=>8, 14=>8, 15=>7, 16=>7, 17=>9, 18=>8, 19=>8,
              20=>6, 30=>6, 40=>5, 50=>5, 60=>5, 70=>7, 80=>6, 90=>6}

timing_method do

  limit = 1000

  sum = 0
  i = 1

  while i <= limit
    temp_i = i
    count = 0 # Placeholder for number count
    while temp_i > 0
      if (temp_i / 1000) >= 1 # Number is >= 1000
        count += "thousand".length
        count += digit_hash[temp_i / 1000] # Accounts for <digit> thousand
        temp_i -= 1000 # Subtract 1000 from number to calculate remaining digit=>length
      elsif (temp_i / 100) >= 1 # Number is >= 100
        count += "hundred".length
        if (temp_i % 100) != 0
          count += "and".length # Number is not a multiple of 100; include the word "and"
        end
        count += digit_hash[temp_i / 100] # Accounts for <digit> hundred
        temp_i -= ((temp_i/100)*100) # Subtract X-hundred from number to calculate remaining digit=>length
      else # Number is < 100
        if (temp_i / 10) >= 2 # Number is >= 20
          count += digit_hash[(temp_i / 10) * 10]
          temp_i -= ((temp_i / 10)*10) # Subtract x*10 from number to calculate remaining digit=>length
        else # Number is < 20
          count += digit_hash[temp_i]
          temp_i -= temp_i # Set temp_i to 0
        end
      end
    end
    sum += count
    i += 1
  end

  puts sum

end
