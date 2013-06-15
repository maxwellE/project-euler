class MaximumPathSum
  attr_reader :triangle
  def initialize(fh)
    @triangle = []
    File.open(fh).each_line do |l|
      @triangle.push l.strip.split(/\s+/).map{|x| x.to_i}
      @triangle.flatten!
    end
  end

  def sum
    dfs([], @triangle.first, 0)
  end

  def dfs(current_stack,node,sum)
    
  end
end
