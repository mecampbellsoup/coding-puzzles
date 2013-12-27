require 'pry'

class Parser
  attr_accessor :yaml
  attr_reader :data

  def initialize(path)
    @yaml = Hash.new { |hash, key| hash[key] = {} }
    # passing array of lines to parse method
    parse data_file(path) 
  end

  def data_file(path)
    string = File.read(path)
    @data = string.split("\n")
  end

  def parse(lines)
    previous_key = nil
    position = nil
    lines.each do |line|
      key, value = line.split(":").map &:strip
      value = {} if value.nil?
      if line.index(/\S/) == 0
        # top-level hash key
        yaml[key] = value
        previous_key = key
      elsif line.index(/\S/) == position
        # this is where we have another line in same sub-hash
        yaml[previous_key][key] = value
      elsif line.index(/\S/) != position
        # this line is further nested than its parent
        yaml[previous_key][key] = value
      end
      position = line.index(/\S/)
    end
    yaml
  end

end
