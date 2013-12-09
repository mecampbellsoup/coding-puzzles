class Array

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

end

some_numbers = [5,6,7,8]
some_numbers.my_each_with_index do |x, i|
  puts "At index #{i} the value is #{x}"
end