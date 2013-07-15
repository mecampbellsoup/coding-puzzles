# require 'pry'

# def my_sort some_array  # This "wraps" rec_sort so you don't have to pass rec_sort an empty array each iteration  
#   rec_sort some_array, []
# end

# def rec_sort unsorted, sorted
#   if unsorted.length <= 0
#     return sorted
#   end

#   # we still have the sorting work to do if we got this far...

#   smallest = unsorted.pop  # why don't we just start with the last element of unsorted?
#   still_unsorted = [] 

#   unsorted.each do |test_value|
#     if test_value < smallest
#       still_unsorted.push(smallest)
#       smallest = test_value
#     else
#       still_unsorted.push(test_value)
#     end
#   end

#     sorted.push(smallest)
#     rec_sort(still_unsorted, sorted)
# end

# pp my_sort [5,3,2,9,0,23, -4]


def my_shuffle some_array 
  rec_shuffle some_array, []
end

def rec_shuffle unshuffled, shuffled
  if unshuffled.length <= 0
    return shuffled
  end

  shuffled_element = unshuffled.sample # preps a random element in unshuffled for move into not_quite_shuffled
  unshuffled = unshuffled - shuffled_element
  binding.pry
  not_quite_shuffled = []

  unshuffled.each_with_index do |element, i|
    not_quite_shuffled.push(shuffled_element) unless element[i] == not_quite_shuffled[i]
    shuffled_element = element
  end

    shuffled.push(shuffled_element)
    rec_sort(not_quite_shuffled, shuffled)
end

pp my_shuffle [1,2,3,4,5,6,7,8,9,10]
