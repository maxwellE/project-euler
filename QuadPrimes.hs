import Data.Numbers.Primes

main :: IO()
main = print longestQuad

consecutivePrimes a b = conseqPrimes a b 0 
                        where
                        conseqPrimes a_cof b_cof n | (isPrime . (+ (n^2)) . (+b)) (a_cof*n) = conseqPrimes a_cof b_cof (n+1)
                                                   | n > 0 = n
                                                   | otherwise = 0

longestQuad = maximum [((consecutivePrimes a b)  ,(a*b)) | a <- [-1000..1000], b <-[-1000..1000]]
