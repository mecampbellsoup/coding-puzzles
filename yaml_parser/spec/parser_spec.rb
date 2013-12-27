require_relative 'spec_helper'

describe Parser do

  let(:simple_path)    { File.join(Dir.pwd, "data/simple.yaml") }
  let(:no_nest_path)   { File.join(Dir.pwd, "data/nothing_nested.yaml") }
  let(:shipping_path)  { File.join(Dir.pwd, "data/shipping.yaml") }
  let(:simple)         { Parser.new(simple_path) }
  let(:nothing_nested) { Parser.new(no_nest_path) }
  let(:shipping)       { Parser.new(shipping_path) }

  context '#initialize' do
    it 'is initialized with a yaml attribute that is a nested hash by default' do
      expect(simple.yaml["new_key"]).to eq({})
      expect(simple.yaml["new_key"]).to_not be_nil
    end
  end

  context 'Hash#r_has_key?' do 
    it 'should return true when the key is present in self.yaml' do
      expect(simple.yaml.r_has_key?("invoice")).to be_true
      expect(simple.yaml.r_has_key?("given")).to be_true
    end
    it 'should return false when the key is not present in self.yaml' do
      expect(simple.yaml.r_has_key?("cowabunga")).to be_false
    end
  end

  context '#parse' do
    it 'turns a very simple yaml file into a one-level hash' do
      expect(nothing_nested.yaml).to be_a Hash
      expect(nothing_nested.yaml).to include(*["invoice", "date", "billto"])
    end
    it 'turns a 2-dimensional yaml file into a nested hash' do 
      expect(simple.yaml["billto"]).to be_a Hash
      expect(simple.yaml["billto"].size).to eq 3
    end
    it 'can handle symbols that indicate the data structure should be adjusted' do
      pending
      expect(shipping.yaml).to be_a Hash
      expect(shipping.yaml.size).to eq 8
    end
  end

  context 'the YAML object' do
    it 'can respond to standard hash key notation' do
      expect(nothing_nested.yaml["invoice"]).to eq "34843"
      expect(nothing_nested.yaml["date"]).to eq "2001-01-23"
    end
    it 'can also respond to dot notation' do
      expect(nothing_nested.yaml.r_has_key?("invoice")).to be true
      expect(nothing_nested.yaml.invoice).to eq "34843"
      expect(nothing_nested.yaml.date).to eq "2001-01-23"
    end
  end
end