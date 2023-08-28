# frozen_string_literal: false

require 'minitest/autorun'

def everyother_cap(strs)
  # store 2 arrays of tuples; tuple will be index and string
  # 1 array will be valid strings
  # 1 array will be invalid strings; e.g. leading with non letter character
  bad_strings = strs.map{ |w| [w] if w.start_with?(/[^a-zA-Z]/) }
  good_strings = strs.map.with_index { |w, i| [i.even? ? w.capitalize : w] if w.start_with?(/[a-zA-Z]/) }
  good_strings.zip(bad_strings).flatten.compact.join(" ")
  # strs.each_with_index { |s, i| s.capitalize! if i.even? }.join(' ')
end


describe '#everyother_cap' do
  # it 'should cap everyother word' do
  #   _(everyother_cap(%w[a b c])).must_equal 'A b C'
  #   _(everyother_cap(%w[the quick brown fox jumped over the lazy dog])).must_equal(
  #     'The quick Brown fox Jumped over The lazy Dog'
  #   )
  # end

  it 'should skip over invalid words' do
    _(everyother_cap(%w(#kool beans beans))).must_equal '#kool beans Beans'
  end
end
