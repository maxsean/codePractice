def is_prime?(num)
  (2..Math.sqrt(num)).each do |divisor|
    if num % divisor == 0
      return false
    end
  end

  true
end

def max_prime(n)
  i = n
  while i > 1 do
    if is_prime?(i)
      return i
    else
      i -= 1
    end
  end
end
