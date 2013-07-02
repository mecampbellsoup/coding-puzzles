require 'pry'

def triangle_to_array(file)
	lines = []
	triangle = File.open(file)
	to_array = triangle.each_line do |line|
		binding.pry
		lines << line.to_i
	end
end

puts triangle_to_array("/Users/matthewcampbell/Desktop/triangle.txt")

