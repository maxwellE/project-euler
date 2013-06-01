import Data.Char

intToSum :: Integer -> Int
intToSum = (sum . (map digitToInt) . show)

sums = [intToSum (a^b) | a<-[1..100],b<-[1..100]]

main :: IO()
main = print $ maximum sums
