require 'minitest/autorun'

class SuperFizzBuzz
  def output(num)
    str = ""
    str << "Fizz" if num % 3 == 0
    str << "Buzz" if num % 5 == 0
    str = "Super" + str if num % 7 == 0

    return num.to_s if str.empty?
    return str
  end

  def output_range(alpha, omega)
    arr = []
    (alpha..omega).each { |i| arr << output(i) }
    return arr
  end

  def parse_input(input)
    nums = input.split(",").map(&:strip).map(&:to_i)
    if nums.size > 1
      return output_range(nums[0], nums[1])
    else
      return output(nums[0])
    end
  end
end


describe SuperFizzBuzz do
  super_fizz = SuperFizzBuzz.new
  it 'should return fizz if divisible by 3' do
    _(super_fizz.output(3)).must_equal 'Fizz'
    _(super_fizz.output(9)).must_equal 'Fizz'
  end

  it 'should return buzz if divisible by 5' do
    _(super_fizz.output(5)).must_equal 'Buzz'
    _(super_fizz.output(10)).must_equal 'Buzz'
  end

  it 'should return super if divisible by 7' do
    _(super_fizz.output(7)).must_equal 'Super'
    _(super_fizz.output(14)).must_equal 'Super'
  end

  it 'should return fizzbuzz if divisible by 3&5' do
    _(super_fizz.output(15)).must_equal 'FizzBuzz'
  end

  it 'should return fizzbuzz if divisible by 3&5' do
    _(super_fizz.output(15)).must_equal 'FizzBuzz'
  end

  it 'should return superfizz if div by 3&7' do
    _(super_fizz.output(21)).must_equal 'SuperFizz'
  end

  it 'should return superbuzz if div by 5&7' do
    _(super_fizz.output(35)).must_equal 'SuperBuzz'
  end

  it 'should return superfizzbuzz if div by 3&5&7' do
    _(super_fizz.output(105)).must_equal 'SuperFizzBuzz'
  end

  it 'should return just the number if !div by 3&5&7' do
    _(super_fizz.output(8)).must_equal "8"
  end

  it 'should output a range' do
    _(super_fizz.output_range(8, 15)).must_equal ["8", "Fizz", "Buzz", "11", "Fizz", "13", "Super", "FizzBuzz"]
  end

  it 'should parse input' do
    puts "Welcome to SuperFizzBuzz! Enter a number or a range..."
    input = gets.chomp # input 15
    _(super_fizz.parse_input(input)).must_equal "FizzBuzz"
    puts "Welcome to SuperFizzBuzz! Enter a number or a range..."
    input = gets.chomp # input 8, 15
    _(super_fizz.parse_input(input)).must_equal ["8", "Fizz", "Buzz", "11", "Fizz", "13", "Super", "FizzBuzz"]
  end
end

# 1000.times { |i| p output(i+1)}
