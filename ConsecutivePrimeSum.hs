import Data.Numbers.Primes
main :: IO()
main = print $ maximum $ listOfLengthsAndSums 1000000

sumLength :: Int -> Int
sumLength n = length $ primeSum (takeWhile (<n) primes) n

primeSum lst m = pSum lst m 0 []
	where pSum list n sum save | n == sum = save
					| (null list) = []
					| sum < n = pSum (tail list) n (sum+(head list)) ((head list):save)
					| otherwise = []

maxSum limit = maximum $ map (\x-> ((sumLength x), x)) $ takeWhile (<limit) primes

sumOfLastPrimes i j = sum $ drop i $ take j primes

listOfLengthsAndSums limit =  [(j-i, sumOfLastPrimes i j) | j <- [0..limit], i<-[0..limit], (sumOfLastPrimes i j) < limit, isPrime $ sumOfLastPrimes i j]
