previous = nil
[1,2,3,4].each do |i|
  if i == 4
    puts i
    puts "The previous value was #{previous}"
  else
    previous = i
    puts i
  end
end