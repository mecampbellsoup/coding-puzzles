def factorial (num)
  return 1 if num <=1
  num * factorial(num - 1)
end

p factorial 8736
p factorial(8736).class