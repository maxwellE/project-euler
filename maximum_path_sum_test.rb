require_relative "maximum_path_sum"
require "minitest/autorun"

describe MaximumPathSum do
  before do
    @mps = MaximumPathSum.new "problem67.txt"
    @mps_small = MaximumPathSum.new "problem67_2.txt" 
  end

  it "should get a triangle with the correct number of rows" do
    @mps.triangle.length.must_equal 5050
  end

  it "should get a maximum path sum that is correct!" do
    @mps_small.sum.must_equal 23
  end
end
