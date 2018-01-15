def fizzbuzz?(number)
  return 'Fizzbuzz' if number % 15 == 0
  return 'Buzz' if number % 5 == 0
  return 'Fizz' if number % 3 == 0
  number
end

(1..100).each { |n| p fizzbuzz(n) }
