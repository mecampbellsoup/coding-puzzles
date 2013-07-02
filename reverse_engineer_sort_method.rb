# we need a method that replicates Array.sort method built-in to Ruby
# we will need recursion as we go thru each word pair in the unsorted Array
# we will need recursion again as we compare each new word that is being sorted
# to the words already stored in the sorted Array

def sort some_array  # This "wraps" recursive_sort.
  recursive_sort some_array, []
end

def recursive_sort unsorted_array, sorted_array
  # Your fabulous code goes here.
end