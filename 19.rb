#!/usr/bin/env ruby

require 'timing_method'
require 'date'

# You are given the following information, but you may prefer to do some research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
#
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

yearend = 2000

def find_sundays(d1, d2)
  d1 +=1 while (d1.wday != 0)
  count = 0
  d1.step(d2, 7) do |date|
    # puts "#{Date::MONTHNAMES[date.mon]} #{date.day}, #{date.year}" if date.mday == 1
    date.mday == 1 ? count += 1 : nil
  end
  count
end

timing_method do
  puts "Using Date class"
  puts "Number of Sundays that feel on the 1st of the month:  #{find_sundays(Date::civil(1901, 1, 1), Date::civil(yearend, 12, 31))}"
end

puts

timing_method do
  puts "Not using Date class"

  month_lengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  month_names = %w(January February March April May June July August September October November December)

  sundaycount = 0
  startday = 2 # 1901 began on a Tuesday (day 2 of the week)

  (1901).upto(yearend){|year|
    0.upto(11){|month|
      if startday % 7 == 0 # It's a Sunday
        # puts "#{month_names[month]} 1, #{year}"
        sundaycount += 1
      end
      ( (year % 4 == 0 && year % 100 != 0) && month == 1) || ( (year % 400 == 0) && month == 1) ? startday += 1 : nil # Account for leap year
      startday += month_lengths[month]
    }
  }

  puts "Number of Sundays that fell on the 1st of the month:  #{sundaycount}"

end
