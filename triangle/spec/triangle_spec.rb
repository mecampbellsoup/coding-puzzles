require_relative 'spec_helper'

describe Triangle do

  let(:path) { 'data/triangle_small.txt' }
  let(:triangle) { Triangle.new(path)}

  it 'should return the sum of the path whose sum is greatest' do
    expect(triangle.largest_path_sum).to eq 112
  end
  
end