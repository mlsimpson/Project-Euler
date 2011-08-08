#!/usr/bin/env ruby

require 'timing_method'

# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 * 53 = 49714.
#
# What is the total of all the name scores in the file?
timing_method do

  # Create a hash of letter values
  charvals = (1..26).to_a
  letters = ("A".."Z").to_a
  letters = letters.zip(charvals).inject({}){|result, element|
    result[element.first] = element.last
    result
  }

  # Read in the data, separate it into an array, and sort it
  names = File.new('names.txt').gets.split(',').map!{|name| name.gsub! /"/, ''}.sort!

  sum = 0
  names.each_index{|nameindex|
    tempsum = 0
    names[nameindex].chars.to_a.each{|char|
      tempsum += letters[char]
    }
    sum += tempsum*(nameindex+1)
  }

  puts "Total of all name scores is #{sum}"

end

timing_method do

  # Create a hash of letter values
  charvals = (1..26).to_a
  letters = ("A".."Z").to_a
  letters = letters.zip(charvals).inject({}){|result, element|
    result[element.first] = element.last
    result
  }

  # Read in the data, separate it into an array, and sort it
  names = File.new('names.txt').gets.split(',').map!{|name| name.gsub! /"/, ''}.sort!

  sum2 = 0
  names.each_with_index{|name, index|
    sum2 += (index + 1) * name.chars.to_a.inject(0){|namesum, char|
      namesum += letters[char]
    }
  }

  puts "Total of all name scores is #{sum2}"

end
