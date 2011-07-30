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
  puts find_sundays(Date::civil(1901, 1, 1), Date::civil(2000, 12, 31))
end
