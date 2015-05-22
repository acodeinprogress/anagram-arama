require 'rspec'
require_relative '../reverse_letters.rb'

describe "#reverse_letters" do
  let(:letters) { 'ab' }

  it "returns the letters in reverse" do
    expect(reverse_letters(letters)).to eq('ba')
  end

  it "returns an array of length 2" do
    expect(reverse_letters(letters).length).to eq(2)
  end
end
