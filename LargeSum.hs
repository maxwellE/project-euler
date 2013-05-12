import Data.List
import System.IO

main = do
       fh <- readFile "problem13numlist.txt"
       let readLines = (lines fh)
       print $ take 10 $ show $ sumList readLines

sumList :: [[Char]] -> Integer
sumList list = addUpList $ map(\x -> (read x::Integer)) list

addUpList :: [Integer] -> Integer
addUpList list = foldr (+) 0 list


