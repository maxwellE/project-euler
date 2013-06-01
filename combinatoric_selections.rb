require 'pry'
def fact_gen(limit)
  factorials = {0 => 1, 1 =>1}
  (2..limit).each{|x| factorials[x] = x * factorials[x-1]}
  factorials
end

FACTORIALS = fact_gen(100)

count = 0

(1..100).each do |n|
  (1..n).each do |r|
    combo = FACTORIALS[n]/(FACTORIALS[r] * (FACTORIALS[n-r]))
    if combo > 1000000
      count +=1
    end
  end
end
puts "Total Count #{count}"
