#!/usr/bin/env ruby

class SudokuSolver
  def initialize(fh)
    begin
      @content = File.read(fh)
    rescue
      raise ArgumentError, "Could not open file #{fh}, exiting program."
    end
    @grid = []
    parse_input
  end
  
  def original_grid
    puts stringify_grid(@grid)
  end
  
  def generate_output_string
    sol = solve(@grid)
    if sol
      stringify_grid(sol)
    else
      "No possible solution found!"
    end
  end

  def solve(grid)
    possibilities = generate_possibilities(grid)
    if has_contradiction? possibilities
      return nil
    end
    moves = select_best_moves possibilities
    next_move = moves.first
    return grid if next_move.nil?
    next_move.last.each do |val|
      ret = solve(make_move(next_move.first,val,grid))
      return ret if ret
    end
    return nil
  end

  private

  def stringify_grid(grid)
    joined_columns = grid.collect do |line|
      fixed_line = line.map do |x|
        if x.nil?
          "."
        else
          x
        end
      end
      fixed_line.each_slice(3).to_a.map{|x| x.join}.join("|")
    end
    joined_columns.each_slice(3).to_a.map{|x| x.join "\n"}.join("\n-----------\n").strip
  end
  
  def parse_input
    lines = @content.strip.split("\n")
    if lines.length != 11
      raise ArgumentError, "Invalid grid layout detected, quitting now."
    end
    lines.each do |e|
      next if e[0] == '-'
      raise ArgumentError, "Invalid grid layout detected, quitting now." if e.length != 11
      @grid.push parse_line(e).flatten
    end
  end

  def parse_line(line)
    line.split('|').collect do |x| 
      x.split('').map do |element|
        if element == "."
          nil
        else
          element.to_i
        end
      end
    end
  end

  def generate_possibilities(grid)
    possibilities = grid.map{|row| row.dup}
    grid.each_with_index do |line,lindex|
      line.each_with_index do |cell,cindex|
        if cell.nil?
          values = check_box(lindex,cindex,grid)
          values = check_column(cindex,values,grid)
          values = check_line(lindex,values,grid)
          possibilities[lindex][cindex] = values
        end
      end
    end
    possibilities
  end
 
  def check_box(lindex,cindex,grid)
    possible_values = (1..9).to_a
    line_offset = lindex.divmod(3).first
    column_offset = cindex.divmod(3).first
    (0..2).each do |line_index|
      (0..2).each do |column_index|
        value = grid.at(line_offset * 3 + line_index).at(column_offset * 3 + column_index)
        possible_values.delete(value)
      end
    end
    possible_values
  end

  def check_column(cindex,current_values,grid)
    column_values = []
    (0..8).each do |line_index|
      column_values.push grid.at(line_index).at(cindex) unless grid.at(line_index).at(cindex).nil?
    end
    current_values - column_values
  end
  
  def check_line(lindex,current_values,grid)
    line_values = []
    (0..8).each do |column_index|
      line_values.push grid.at(lindex).at(column_index) unless grid.at(lindex).at(column_index).nil?
    end
    current_values - line_values
  end

  def valid_solution?(grid)
    grid.flatten.compact.each do |val|
      if val.nil? || grid.count(val) != 9
        return false
      end
    end
    return true
  end

  def select_best_moves(possibilities)
    indexed_possibilites = {}
    possibilities.each_with_index do |line,lindex|
      possibilities.each_with_index do |column, cindex|
        indexed_possibilites["#{lindex},#{cindex}"] = possibilities[lindex][cindex]
      end
    end
    indexed_possibilites.delete_if{|k,v| v.class == Fixnum}.sort_by{|k,v| v.length}
  end

  def make_move(coordinates,value,grid_state)
    new_state = grid_state.map{|row| row.dup}
    true_coordinates = coordinates.split(",").map{|x| x.to_i}
    new_state[true_coordinates.first][true_coordinates.last] = value if new_state[true_coordinates.first][true_coordinates.last].nil?
    new_state
  end

  def has_contradiction?(possibility_grid)
    possibility_grid.each do |line|
      line.each do |cell|
        if cell == []
          return true
        end
      end
    end
    false
  end
end

def main
  begin
    if ARGV[0]
      ss = SudokuSolver.new(ARGV[0])
      puts "Provided Grid:\n-------------------------"
      puts ss.original_grid
      puts "\nSolution:\n-------------------------"
      puts ss.generate_output_string
    else
      raise ArgumentError, "No file name provided, exiting now."
    end
  rescue ArgumentError => e
    puts e.message
  end
end

if __FILE__ == $0
  main
end

