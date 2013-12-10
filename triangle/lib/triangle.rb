class Triangle

  attr_reader :file, :parsed_data, :data, :node, :total_paths
  attr_accessor :largest_path

  def initialize(path)
    @file = File.open(File.join(Dir.pwd, path))
    @largest_path = 0
    @parsed_data = parse_data
    @data = data_to_binary_elements
    @node = data[0][0]
    @total_paths = 2**(data.size - 1)
  end

  def parse_data
    file.each_line.map { |line| line.strip.split(" ").map &:to_i }
  end

  def data_to_binary_elements
    parsed_data.each_with_index.map do |row, row_index|
      row.each_with_index.map do |value, position_in_row|
        Element.new(value, row_index, position_in_row)
        # each Element needs to know its value, and its left and right neighbors on the next step
        # value represents the Element's value
        # position represents its position in the row
      end
    end
  end

  def all_values
    values = []
    node.each(data) { |elem| values << elem.value; elem.visited = true }
    values
  end

  def sum_of_values
    all_values.inject { |x,y| x+y }
  end

end