import Data.List
main :: IO()
main = print $ sum $ map sumTuple $ nub $ map amicablePair [200..10000]

amicableSum :: Integer -> Integer
amicableSum n = sum $ filter ((==0) .(mod n)) [1..(n `div` 2)]

amicablePair :: Integer -> (Integer,Integer)
amicablePair n | (amicableSum (amicableSum n)) == n && n /= (amicableSum n) = (tuplefy . sort) [n, (amicableSum n)]
               | otherwise = (0,0)

tuplefy :: [a] -> (a,a)
tuplefy [x,y] = (x,y)

sumTuple :: (Integer,Integer) -> Integer
sumTuple (x,y) = x+y
