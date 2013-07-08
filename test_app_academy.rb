def silly_sum array
  silly_sum = 0
  i = 0
  while i < array.length
    product = array[i] * i
    silly_sum += product
    i += 1
  end
  return silly_sum
end

puts silly_sum([2,3,5,7,8]) #expected result is 66 


def perfect_square num
  if Math.sqrt(num) == Math.sqrt(num).to_i
    return true
  else
    return false
  end
end

def num_squares max
  num_squares = 0
  for i in 1...(max)
    if perfect_square(i)
      num_squares += 1
    end
  end
  return num_squares
end

puts num_squares(25)


def silly_nums max
  silly_nums = []
  for i in 1...(max)
    if i % 3 == 0 && i % 5 == 0
      next
    elsif i % 3 == 0 || i % 5 == 0
      silly_nums << i
    end
  end
  #binding.pry
  return silly_nums
end

p silly_nums(10)




