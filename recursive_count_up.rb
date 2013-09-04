require 'pry'

def cu(counter, max)
  puts "Counter value is = #{counter}"  
  return max if counter >= max  #cease stacking calls once counter equals max
  counter+cu(counter+1,max)
end

def cd(num)
  puts "Counter value is = #{num}"
  return 1 if num <= 1
  num+cd(num-1)
end

p cu(1,5)
p cd(5)

