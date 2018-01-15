def fib(n)
  if n <= 2
    return 1
  else
    return fib(n-1) + fib(n-2)
  end
end

def fibo(n)
  index = 3
  a, b = 1, 1
  if n <= 2
    return 1
  else
    while index <= n do
      temp = a + b
      a = b
      b = temp
      index += 1
    end
  end
  return temp
end
