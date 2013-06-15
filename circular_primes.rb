require 'mathn'
require 'pry'
def circular_prime(n)
  is_circular = true
  n_digits = n.to_s.chars.map{|x| x.to_i}.rotate
  until n_digits.join == n.to_s
    unless n_digits.join.to_i.prime?
      is_circular = false
    end
    n_digits.rotate!
  end
  is_circular
end

def circular_primes_under(limit)
  count = 0
  Prime.take_while{|x| x < limit}.each do |x|
    if circular_prime x
      count += 1 
    end
  end
  puts "Total circular primes: #{count}"
end

circular_primes_under(1000000)
