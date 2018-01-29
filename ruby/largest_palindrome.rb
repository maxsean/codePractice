def is_palindrome?(num)
  initial = num
  reversed = 0

  while initial > 0 do
    reversed = reversed * 10
    reversed += initial % 10
    initial = initial / 10
  end

  num == reversed
end

def largest_palindrome(d)
  max = 0
  a = ((10**(d-1))..(10**(d)-1)).to_a
  i = a.size - 1
  j = i

  while i > -1 do
    while j > -1 do
      product = a[i]*a[j]
      if product > max
        if is_palindrome?(product)
          max = product
        end
      end
      j -= 1
    end
    i -= 1
    j = i
  end
  max
end

t1 = Time.now
puts largest_palindrome(3)
puts "done in #{Time.now - t1} seconds"
