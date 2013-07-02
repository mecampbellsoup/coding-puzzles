require 'pry'

comments = []

while true
	#puts "What do you say to grandma?" #can remove this later
	comment = gets.chomp
	comments << comment
	if (comment != comment.upcase)
		puts "HUH?! SPEAK UP, SONNY!"
	elsif (comment == comment.upcase)
		puts "NO, NOT SINCE #{(1930..1950).to_a.sample}!"
	end
	#binding.pry
	break if comments[-3,3] == ["BYE", "BYE", "BYE"]
	#puts comments[-3,3]
end
