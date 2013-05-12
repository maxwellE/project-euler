require 'minitest/autorun'
require_relative "largest_product_in_grid"
describe LargestProductInGrid do
  before do 
    @lpg = LargestProductInGrid.new("grid.txt")
  end

  it "must have the correct dimensions for the grid" do
    @lpg.grid.length.must_equal 400
  end

  it "must get the correct diagnoals off of the given index" do
    @lpg.diagnoals_at(0,0).length.must_equal 1
    @lpg.diagnoals_at(0,0).first.length.must_equal 4
    @lpg.diagnoals_at(0,0).first.reduce(:*).must_equal 279496 
  end

  it" must get the correct horizonals off of the given index" do
    @lpg.horizonals_at(0,0).length.must_equal 1
    @lpg.horizonals_at(0,0).first.length.must_equal 4
  end

  it "must get the correct verticals off of the given index" do
    @lpg.verticals_at(0,0).length.must_equal 1
    @lpg.verticals_at(0,0).first.length.must_equal 4
  end

  it "must collect the products of the grid" do
    @lpg.products.must_include 1788696
  end

end
  
