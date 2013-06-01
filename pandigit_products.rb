require 'pry'
COMBINATIONS = (0..8).to_a.combination(2).to_a.select{|x| x.last < 8 && x.last > x.first}

PRODUCTS = []

def pandigital_product?(seq)
  COMBINATIONS.each do |list|
    lower = list.first
    upper = list.last
    p1 = seq[0..lower].join.to_i
    p2 = seq[(lower+1)..upper].join.to_i
    res = seq[(upper+1)..-1].join.to_i
    if p1 * p2 == res
      unless PRODUCTS.include? res
        PRODUCTS.push res
      end
    end
  end
end

(1..9).to_a.permutation.each do |x|
  pandigital_product? x
end

binding.pry
