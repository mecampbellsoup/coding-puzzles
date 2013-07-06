def pow base, exponent
  raise 'Params must be non-negative integers' if base < 0
  raise 'Params must be non-negative integers' if exponent < 0
  
  product = base

  if exponent == 1
    return base
  elsif exponent == 0
    return 1
  else
    return base * pow(base, exponent-1)
  end
end

#puts pow(2,15)


def summation array_of_numbers  #This method will take an array_of_numbers and return their sum
  if array_of_numbers.empty?
    return 0
  else
    digit = array_of_numbers.pop
    return digit + summation(array_of_numbers)
  end
end

puts summation([4,5,6])

def is_prime? num  #takes a number num and returns true if it is prime and false otherwise.
  start = 2
  while true
  start.upto(num) do
    num % start == 0
    start += 1
  end
end

is_prime?(5)