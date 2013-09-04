require 'pry'
require 'awesome_print'

ap num_lines = File.open('triangle_small.txt').each_line.count
triangle = File.open('triangle_small.txt').each_line.collect { |line| line.strip.split(" ").map{ |s| s.to_i } }  # now I have an array of arrays, each line being an array

storage = []
index = 0

triangle.each do |array|
  next_one = array[index..index+1].max
  index = array.index(next_one)
  storage << next_one
end

ap storage.inject{ |x,y| x+y }

# array = triangle[0] 
# next_one = array[index..index+1].max
# storage << next_one
# index = array.index(next_one)

# ap storage
# ap index

# array2 = triangle[1]
# next_one = array2[index..index+1].max
# storage << next_one
# index = array2.index(next_one)

# ap storage
# ap index

# array3 = triangle[2]
# next_one = array3[index..index+1].max
# storage << next_one
# index = array3.index(next_one)

# ap storage
# ap index

# array4 = triangle[3]
# next_one = array4[index..index+1].max
# storage << next_one
# index = array4.index(next_one)

# ap storage
# ap index





