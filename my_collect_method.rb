require_relative 'my_each_method'
require 'pry'

class Array

  def my_collect
    results = []
    self.my_each do |i|
      results << yield(i)
    end
    results
  end
end

# sports = ["baseball", "soccer", "basketball", "football", "rugby"]

# sports.my_each do |sport|
#   puts "I like to play #{sport}!"
# end

squares = [4,5,6].my_collect do |i|
  i*i
end

p squares