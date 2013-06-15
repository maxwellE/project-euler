collatzSequenceLength :: Int -> Int -> Int -> (Int,Int)
collatzSequenceLength start 1 cLength = (cLength+1, start)
collatzSequenceLength start n cLength
   | even n = collatzSequenceLength start (n `div` 2) (cLength+1)
   | otherwise = collatzSequenceLength start (3*n + 1) (cLength+1)

getCollatzSequenceLength :: Int -> (Int,Int)
getCollatzSequenceLength i = collatzSequenceLength i i 0

main :: IO()
main = print $ maximum $ map getCollatzSequenceLength [1..999999]
