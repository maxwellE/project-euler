require 'mathn'
require 'pry'

primes = Prime.each(5000).to_a

prime_lengths = []

(1..primes.length).to_a.combination(2).each do |combo|
  lower = combo.first
  upper = combo.last
  next if upper <= lower
  primesum = primes[lower..upper].reduce(:+)
  if primesum.prime?
    prime_lengths.push [upper-lower,primesum]
  end
end

binding.pry
