require 'matrix'

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fib(n)
    (FIB_MATRIX**(n-1))[0,0]
end

4_000_000.times do |i|
  puts fib(i)
end
