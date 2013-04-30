require 'pry'
class LargestProductInGrid
  attr_reader :grid
  def initialize(fh)
    tmpgrid = []
    File.open(fh).each_line do |line|
      tmpgrid.push line.split.map{|x| x.to_i}
    end
    @grid = {} 
    tmpgrid.each_with_index do |e, lindex|
      e.each_with_index do |num, cindex|
        @grid["#{lindex},#{cindex}".to_sym] = num
      end
    end
  end

  def diagnoals_at(lindex,cindex)
    bottomr_diag = (0..3).collect{|x| @grid["#{lindex+x},#{cindex+x}".to_sym]}.compact
    bottoml_diag = (0..3).collect{|x| @grid["#{lindex+x},#{cindex-x}".to_sym]}.compact
    topr_diag = (0..3).collect{|x| @grid["#{lindex-x},#{cindex+x}".to_sym]}.compact
    topl_diag = (0..3).collect{|x| @grid["#{lindex-x},#{cindex-x}".to_sym]}.compact
    [bottoml_diag, bottomr_diag, topl_diag, topr_diag].delete_if{|x| x.length <4}
  end

  def horizonals_at(lindex,cindex)
    right = (0..3).collect{|x| @grid["#{lindex},#{cindex+x}".to_sym]}.compact
    left = (0..3).collect{|x| @grid["#{lindex},#{cindex-x}".to_sym]}.compact
    [left,right].delete_if{|x| x.length < 4}
  end

  def verticals_at(lindex,cindex)
    up = (0..3).collect{|x| @grid["#{lindex-x},#{cindex}".to_sym]}.compact
    down = (0..3).collect{|x| @grid["#{lindex+x},#{cindex}".to_sym]}.compact
    [up,down].delete_if{|x| x.length < 4}
  end

  def products
    values = []
    (0...20).each do |lindex|
      (0...20).each do |cindex|
        values.concat diagnoals_at(lindex,cindex).collect{|x| x.reduce(:*)}
        values.concat horizonals_at(lindex,cindex).collect{|x| x.reduce(:*)}
        values.concat verticals_at(lindex,cindex).collect{|x| x.reduce(:*)}
      end
    end
    values
  end

  def find_max
    products.max
  end
end

if $0 == __FILE__
  puts LargestProductInGrid.new("grid.txt").find_max
end
