require 'awesome_print'
require 'pry'

# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose terminal value does not exceed four million, find the sum of the even-valued terms.

def fibonacci(terminal_value_not_to_be_exceeded)
  first_two = [1,2]
  while first_two[-1] < terminal_value_not_to_be_exceeded do
    first_two << first_two[-2] + first_two[-1]
  end
  first_two[0, first_two.size-1]  # I want the whole thing except the last value
end

def fibonacci_sum(nth_element)
  array = fibonacci(nth_element)
  array.inject(:+)
end

def fibonacci_sum_evens_only(value)
  array = fibonacci(value)
  array_of_evens = []
  array.each do |i|
    array_of_evens << i if i.even?
  end
  array_of_evens.inject(:+)
end

ap fibonacci(4000000)
ap fibonacci_sum_evens_only(4000000)