# You are given an array (which will have a length of at least 3, but could be very large) containing integers.
# The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N.
# Write a method that takes the array as an argument and returns this "outlier" N.

require 'minitest/spec'
require 'minitest/autorun'

def find_outlier(nums)
  outlier_type = nil
  inspection = []
  # test minimum set to determine outlier type
  nums[0..2].each do |n|
    n.even? ? inspection << :even : inspection << :odd
  end
  inspection.count(:even) >= 2 ? outlier_type = :odd : outlier_type = :even

  nums.each do |n|
    if outlier_type == :even
      return n if n.even?
    else
      return n if n.odd?
    end
  end
end

describe "find_outlier" do
  it "should return the outlier of the array" do
    _(find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])).must_equal(11)
    _(find_outlier([160, 3, 1719, 19, 11, 13, -21])).must_equal(160)
    _(find_outlier([0, 1, 2])).must_equal(1)
     _(find_outlier([1, 2, 3])).must_equal(2)
  end
end

def find_outlier_elegent(integers)
  integers.partition(&:odd?)!.find(&:one?).first
end

describe "find_outlier_elegent" do
  it "should return the outlier of the array" do
    _(find_outlier_elegent([2, 4, 0, 100, 4, 11, 2602, 36])).must_equal(11)
    _(find_outlier_elegent([160, 3, 1719, 19, 11, 13, -21])).must_equal(160)
    _(find_outlier_elegent([0, 1, 2])).must_equal(1)
     _(find_outlier_elegent([1, 2, 3])).must_equal(2)
  end
end
