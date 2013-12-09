class Triangle

  attr_reader :file, :data, :total_paths
  attr_accessor :largest_path_sum

  def initialize(path)
    @file = File.open(File.join(Dir.pwd, path))
    @data = hashify_data
    @total_paths = 2**(data.size - 1)
    # now I have an array of arrays, each line being an array
    traverse_paths
  end

  def parse_data
    file.each_line.map { |line| line.strip.split(" ") }
  end

  def row_to_hash(row)
    hash = {}
    row.each_with_index { |value, index| hash[index] = value.to_i }
    hash
  end

  def hashify_data
    parse_data.each_with_index.map { |row, i| { i => row_to_hash(row) } }
  end

  # here is the Triangle instance method that traverses all possible Paths
  
  def traverse_paths
    total_paths.times do |i|
      Path.new(data)
    end
  end

end