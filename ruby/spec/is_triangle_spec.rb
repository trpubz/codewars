require_relative './spec_helper'
require_relative '../is_triangle'

describe 'isTriangle' do
  it 'Public tests' do

    expect(is_triangle(1, 2, 2)).to be true
    expect(is_triangle(5, 2, 2)).to be false
  end
end
