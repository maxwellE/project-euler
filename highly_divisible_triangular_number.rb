require 'mathn'
module HighlyDivisibleTriangularNumber
  def self.divisor_count(num)
    num.prime_division.inject(1){|product,x| product * (1 + x.last)} 
  end
  
  def self.triangular_number_at(n)
    (n*(n+1))/2
  end

  def self.find_triangular_number(i,limit)
    until self.divisor_count(self.triangular_number_at(i)) > 500
      i+=1
    end 
    self.triangular_number_at(i)
  end
end

if $0 == __FILE__
  puts HighlyDivisibleTriangularNumber::find_triangular_number(1,ARGV.first.to_i)
end
