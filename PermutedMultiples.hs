import Data.Char
import Data.List
import Control.Monad

intToList :: Int -> [Int]
intToList = (sort . (map digitToInt) . show)

permuteMultiple x = and $ map (\x -> (intToList (head x)) == (intToList (last x))) $ replicateM 2 [x, (2*x), (3*x), (4*x), (5*x), (6*x)]

main :: IO()
main = print $ head $ take 1 $ filter permuteMultiple [1..]
