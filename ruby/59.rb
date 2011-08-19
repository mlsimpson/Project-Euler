#!/usr/bin/env ruby -wKU

require "timing_method"
require "rubygems"
require "awesome_print"

# Decrypt cipher1.txt
# Find the sum of the ASCII values in the original text.
#
# The encryption key is three lower case characters.

timing_method do

  data = File.new('cipher1.txt').gets.split(',').map!{|num| num.to_i }

  passwords = []

  broken = false

  ('a'..'z').each{|char1|
    ('a'..'z').each{|char2|
      ('a'..'z').each{|char3|
        str = char1 + char2 + char3
        i = 0
        while i < data.length
          broken = false
          val = data[i] ^ str[i%3]
          # Ascii 32 is " "; Ascii 122 is "z".
          # Anything outside these ranges is garbage.  Kill processing if that's the case.
          if val < 32 || val > 122
            broken = true
            break
          end
          i += 1
        end
        if broken == false
          passwords << str
        end
      }
    }
  }

  realpass = ""

  passwords.each{|pass|
    i = 0
    str = ""
    while i < data.length
      str += (data[i] ^ pass[i%3]).chr
      i += 1
    end
    if str =~ /the/
      puts "Password:  #{pass}"
      puts
      ap str
      puts
      realpass = pass
    end
  }

  i = 0
  asciitotal = 0
  while i < data.length
    asciitotal += data[i] ^ realpass[i%3]
    i += 1
  end

  puts "Total of ascii values in original message:  #{asciitotal}"

end

# look for the highest frequency of recurring numbers
# XOR those with space, and then e.
# The three most frequent characters ^ Space (Ascii 32) reveals the code.
timing_method do

  data = File.new('cipher1.txt').gets.split(',').map!{|num| num.to_i }

  freqs = Hash.new(0)

  data.each{|char|
    freqs[char] += 1
  }

  passchars = []

  freqs.sort{|x, y|
    x[1] <=> y[1]
  }[-3, 3].each{|keyval|
    passchars << (keyval[0] ^ " "[0])
  }

  poss = passchars.permutation.to_a

  broken = false

  pass = ""

  poss.each{|perm|
    str = ""
    i = 0
    broken = false
    while i < data.length
      val = data[i] ^ perm[i%3]
      if val < 32 || val > 122
        broken = true
        break
      end
      i += 1
    end
    if broken == false
      perm.each{|ascii|
        pass += ascii.chr
      }
    end
  }

  puts "Password:  #{pass}"

  i = 0
  text = ""
  asciitotal = 0
  pass = pass
  while i < data.length
    val = data[i] ^ pass[i%3]
    asciitotal += val
    text += val.chr
    i += 1
  end

  ap text
  puts
  puts "Ascii total of characters is:  #{asciitotal}."

end
