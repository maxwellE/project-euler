import Data.Numbers.Primes
import Data.List
main :: IO()
main = print $ last $  distinctPrimes 650 []

distinctPrimes :: Integer -> [Integer] -> [Integer]
distinctPrimes n list | ((==4). length) list = list
		      | ((==4). length . nub . primeFactors) n = distinctPrimes (n+1) (n:list)
		      | otherwise = distinctPrimes (n+1) []
