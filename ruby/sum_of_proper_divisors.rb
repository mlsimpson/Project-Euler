def sum_of_proper_divisors(num)

  orig = num

  if num == 1
    return 0
  end

  sum = 1
  p = 2
  while p*p <= num && num > 1
    if (num%p).zero?
      j = p*p
      num = (num / p)
      while (num%p).zero?
        j = j*p
        num = (num / p)
      end
      sum = sum*(j-1)
      sum = sum / (p-1)
    else
    end
    if p == 2
      p = 3
    else
      p = p+2
    end
  end

  if num > 1
    sum = sum * (num+1)
  end

  sum - orig
end
