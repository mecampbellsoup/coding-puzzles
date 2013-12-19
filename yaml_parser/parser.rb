require 'pry'

class Parser
  attr_accessor :yaml

  def initialize(path)
    self.yaml = {}
    parse data_file(path) # passing array of lines to parse method
  end

  def data_file(path)
    string = File.read(path)
    string.split("\n")
  end

  def parse(lines)
    previous = nil
    lines.each do |line|
      key, value = line.split(":").map &:strip
      if line.strip == line
        # no whitespace, top level of hash
        yaml[key] = value
        previous = key
      else
        nested = {}
        yaml[previous] = nested[key] = value
        yaml[previous] = nested
      end
    end
  end

end

path = File.join(Dir.pwd, "shipping.yaml") 
parser = Parser.new(path)
binding.pry
