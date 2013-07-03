def factorial num
  if num < 0
    return 'You cannot do factorials for negative numbers!'
  elsif num <=1
    1
  else
    num * factorial(num-1)
  end
end

puts factorial(5)