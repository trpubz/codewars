require_relative './spec_helper'
require_relative '../jaden_casing_strings'

describe 'jaden_casing' do
  it 'should capitalize the first letter of words' do
    str = "How can mirrors be real if our eyes aren't real"
    expect(str.toJadenCase).to eq("How Can Mirrors Be Real If Our Eyes Aren't Real")
  end
end

