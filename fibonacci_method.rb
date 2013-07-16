require 'pry'

master_num = 5

# def gen_fib_sequence_up_to_index num
#   rec_gen_fib_values num, []
# end

def gen_fib_values num
  start_array = [1,1]
  count = 0

  if num < start_array.size
    num
  end

  until start_array.size == num
    next_element = start_array[count] + start_array[count + 1]
    start_array.push(next_element)
    count += 1
  end
  return start_array
end

p gen_fib_values(master_num)

def fib_sequence_product sequence_array
  #product = 1
  sequence_array.inject(1) do |product, elem|
    product = product * elem
  end
end

p fib_sequence_product(gen_fib_values(master_num))
