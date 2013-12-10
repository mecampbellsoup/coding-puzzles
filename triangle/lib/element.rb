class Element

  attr_reader :value, :left, :right, :parent
  attr_accessor :visited

  # need to be able to ask an element about its left or right
  # and receive an Element (or nil) object back

  def initialize(value, row_index, position_in_row)
    @visited = false
    @value = value

    @left = Proc.new do |tree|
      if tree[row_index + 1] && tree[row_index + 1][position_in_row]
        tree[row_index + 1][position_in_row]
      else
        nil
      end
    end

    @right = Proc.new do |tree|
      if tree[row_index + 1] && tree[row_index + 1][position_in_row + 1]
        tree[row_index + 1][position_in_row + 1]
      else
        nil
      end
    end
  end

  def visited?
    self.visited
  end

  def each(data, &block)
    self.left.call(data).each(data, &block) if self.left.call(data) && !self.left.call(data).visited?
    yield self
    self.right.call(data).each(data, &block) if self.right.call(data) && !self.right.call(data).visited?
  end

end