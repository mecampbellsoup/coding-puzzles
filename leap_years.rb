require 'pry'

#if a year is divisible by 4 then it's a leap year
#that is, unless it's also divisible by 100 (e.g. 1500 is not a leap year)
#that is, unless it's ALSO divisible by 400 (e.g. 1600 is a leap year)

def leap_years_from_start_to_end
	puts "Welcome to 'Leap Year', the game!"
	puts "You enter the start and end years, and we tell you the years in between that are Leap Years!"
	puts "What year do you want to start with?"
	start_year = gets.chomp.to_i
	puts "Nice choice - and what year should we end with?"
	end_year = gets.chomp.to_i
	(start_year..end_year).each do |year|
		next if year%4 != 0
		next if year%100 == 0 && year%400 != 0
		puts year
	end
end

leap_years_from_start_to_end
