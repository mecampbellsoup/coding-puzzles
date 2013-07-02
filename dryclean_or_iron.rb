#Hi! I am going to build a simple code that, when certain assumption are made,
#will return whether one should wash and iron their shirts themselves, or
#instead pay a dry cleaning service to do it.
require 'pry'

def to_boolean (skill)
	if skill.include? "true"
		true
	else
		false
	end
end

def time_per_unit(skill=false, num_shirts, timeperunit)
	until num_shirts == 0 #This sub-block describes experiential improvement in ironing
		timeperunit = 0.98 * timeperunit
		num_shirts -= 1
		break if num_shirts < 0
	end
	timeperunit
end

def totaltime(timeperunit, num_shirts)
	totaltime = timeperunit * num_shirts / 60
end

def pay_or_self(costperunit, num_shirts, timevalue, totaltime)
	if costperunit*num_shirts > timevalue*totaltime
		puts("The cost outweights the value of your time - get to work!")
	elsif costperunit*num_shirts < timevalue*totaltime
		puts("It's not worth your time - head to the cleaner!")
	else
		puts("Looks like you could go either way - flip a coin!")
	end
end

puts("Hello - how many shirts do you have that need cleaned?")
num_shirts = gets.strip.to_i

puts("How much is 1 hour of your time worth (in dollars)?")
timevalue = gets.strip.to_i

puts("Are you skilled with the iron or not? Please write true or false.")
skill = gets.strip
skill = to_boolean(skill)
if skill == true
	timeperunit = 6
else
	timeperunit = 10
end
diytimeperunit = time_per_unit(skill, num_shirts, timeperunit)
costperunit = 2.25
diytime = totaltime(diytimeperunit, num_shirts)
pay_or_self(costperunit, num_shirts, timevalue, diytime)
binding.pry