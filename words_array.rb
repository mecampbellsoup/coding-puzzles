require 'pry'

array_items = []

while true
	array_item = gets.chomp
	if array_item == "" 
		break 
	else 
		array_items.push array_item
	end
end

puts array_items.sort.join(", ")