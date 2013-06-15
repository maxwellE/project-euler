import Data.List
import Data.Char
import Data.Numbers.Primes

intIsPandigital :: Int -> Bool
intIsPandigital n = ((==[1..(length digitList)]).(sort)) digitList 
                    where digitList = ((map digitToInt) . show) n

pandigitalPrimes =print$ head $ take 37$ filter intIsPandigital $ dropWhile (<=7354261) primes

main ::IO()
main = pandigitalPrimes
