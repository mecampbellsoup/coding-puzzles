require_relative 'spec_helper'

describe Triangle do

  let(:path) { 'data/triangle_small.txt' }
  let(:triangle) { Triangle.new(path)}

  it 'has a #sum_of_values method that sums all the values' do
    expect(triangle.sum_of_values).to eq (234+115)
  end

  it 'has data formatted as arrays of Elements' do
    triangle.data.each do |row|
      expect(row).to be_an Array
      row.each do |datum|
        expect(datum).to be_an Element
      end
    end
  end

  context '#all_values method' do
    it 'should return all values in the triangle' do
      expect(triangle.all_values).to be_a Array
      expect(triangle.all_values).to include 200
    end
  end
  
end