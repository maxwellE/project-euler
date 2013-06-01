import Data.Numbers.Primes
import Data.List
import Control.Monad

main :: IO()
main = print $ sum  abundants

divisorSum lst =  (`div` ((fst lst) -1)) $ ((fst lst) ^ ((snd lst)+1) -1)

abundantNum 1 = False
abundantNum 2 = False
abundantNum n = n < ((((foldl1 (*)) . (map divisorSum) . fixCount . group . primeFactors) n) - n)

fixCount list = map (\x -> ((fromIntegral(head x)), (length x))) list

abundants =  takeWhile (<=28123) $ map sum $ replicateM 2 $ filter (\x -> abundantNum x) [1..28123]


