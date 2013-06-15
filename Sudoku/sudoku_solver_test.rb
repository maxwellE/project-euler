require 'minitest/autorun'
require 'minitest/pride'
require_relative "sudoku_solver"

describe SudokuSolver do
  before do 
    @ss = SudokuSolver.new("input.txt")
    @ss_difficult = SudokuSolver.new("difficult_input.txt")
    @ss_broken = SudokuSolver.new("broken_input.txt")
    @ss_new_format = SudokuSolver.new("newinput.txt")
  end

  it "should find the valid solution" do
    @ss.generate_output_string.must_equal File.read("output.txt")
    @ss_difficult.generate_output_string.must_equal File.read("difficult_output.txt")
    @ss_broken.generate_output_string.must_equal "No possible solution found!"
    @ss_new_format.generate_output_string
  end
end
