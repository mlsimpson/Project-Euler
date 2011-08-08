#!/usr/bin/env ruby

require 'timing_method'
require 'matrix'

x = ARGV[0].to_i

def fib(n)
  n < 2 ? n : fib(n - 1) + fib(n - 2)
end

## Slow, Recursive version
# timing_method do
#   sum = 0
#   i = 1
#   j = 1
#   while i <= 4000000
#     i = fib(j)
#     puts i
#     j += 1
#     if i %2 == 0
#       sum += i
#     end
#   end
#   puts sum
# end

# Faster, iterative version
timing_method do
  sum = 0
  i = 0
  j = 1
  while j < 4000000
    j%2 == 0 ? sum += j : sum += 0
    h = i + j
    i = j
    j = h
  end
  puts sum
end

# Note that every 3rd # is even.  Add every 3rd number instead.
# This is even faster.
timing_method do
  sum = 0
  i = 1
  j = 1
  c = i + j
  while j < 4000000
    sum += c
    i = j + c
    j = i + c
    c = i + j
  end
  puts sum
end

# Ruby method from Project Euler notes
timing_method do
  x, y, sum = 1, 1, 0
  while sum < 4_000_000
      sum += (x + y)
        x, y = x + 2*y, 2*x + 3*y
  end

  puts "Sum is #{ sum }."
end

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fibm(n)
    (FIB_MATRIX**(n-1))[0,0]
end
