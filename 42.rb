#!/usr/bin/env ruby -wKU

require "timing_method"

# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value.
# For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
# If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

def generate_triangles(num=20)

  triarray = Array.new

  1.upto(num){|n|
    triarray << (n*(n+1))/2
  }

  triarray

end

timing_method do

  triangles = generate_triangles

  # Create a hash of letter values
  charvals = (1..26).to_a
  letters = ("A".."Z").to_a
  letters = letters.zip(charvals).inject({}){|result, element|
    result[element.first] = element.last
    result
  }

  # Read in the data, separate it into an array, and sort it
  words = File.new('words.txt').gets.split(',').map!{|name| name.gsub! /"/, ''}

  sum = 0
  words.each{|word|
    if triangles.include?(word.chars.to_a.inject(0){|namesum, char| namesum += letters[char] })
      sum += 1
    end
  }

  puts "There are #{sum} triangle words in words.txt"

end
