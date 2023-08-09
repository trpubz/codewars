require_relative './spec_helper.rb'
require_relative '../vowel_count.rb'

describe "get_count" do
  it "Fixed tests" do
    expect(get_count("abracadabra")).to eq(5)
  end
end
