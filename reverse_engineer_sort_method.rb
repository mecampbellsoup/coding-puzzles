require 'pry'
# we need a method that replicates Array.sort method built-in to Ruby
# we will need recursion as we go thru each word pair in the unsorted Array
# we will need recursion again as we compare each new word that is being sorted
# to the words already stored in the sorted Array

def sort some_array  # This "wraps" rec_sort so you don't have to pass rec_sort an empty array each iteration  
  rec_sort some_array, []
end

def rec_sort unsorted, sorted
  if unsorted.length <= 0
    return sorted
  end

  # we still have the sorting work to do if we got this far...

  smallest = unsorted.pop  # why don't we just start with the last element of unsorted?
  still_unsorted = [] 

  unsorted.each do |test_value|
    if test_value < smallest
      still_unsorted.push(smallest)
      smallest = test_value
    else
      still_unsorted.push(test_value)
    end
  end

    sorted.push(smallest)
    rec_sort(still_unsorted, sorted)
end

puts sort [5,3,2,9,0,23, -4]
