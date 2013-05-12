require_relative 'highly_divisible_triangular_number'
require 'minitest/autorun'
describe HighlyDivisibleTriangularNumber do
  it "should find the correct number of divisors" do
    HighlyDivisibleTriangularNumber::divisor_count(28).must_equal 6
    HighlyDivisibleTriangularNumber::divisor_count(24).must_equal 8
  end

  it "should get the correct triangular number" do
    HighlyDivisibleTriangularNumber::triangular_number_at(7).must_equal 28
  end
end
