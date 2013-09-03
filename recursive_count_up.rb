require 'pry'

def cu(counter, num)
  return num if counter >= num-1 # this needs to stop stacking calls once we reach num
  counter += 1
  counter+cu(counter,num)
end

def cd(num)
  return 1 if num <= 1
  num+cd(num-1)
end

p cu(0,5)

