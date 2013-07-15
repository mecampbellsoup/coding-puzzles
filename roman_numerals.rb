def old_roman_numeral num
	raise 'Must use positive integer' if num <= 0
	roman = ''

	roman << 'M' * (num / 1000) 
	roman << 'D' * (num%1000 / 500)
	roman << 'C' * (num%500 / 100)
	roman << 'L' * (num%100 / 50)
	roman << 'X' * (num%50 / 10)
	roman << 'V' * (num%10 / 5)
	roman << 'I' * (num%5 / 1)

	roman
end

puts "What integer shall we convert to roman numerals?"
num = gets.chomp.to_i
puts old_roman_numeral(num)

#now convert this to include 

roman_numerals = {M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1}
roman_numerals(M)