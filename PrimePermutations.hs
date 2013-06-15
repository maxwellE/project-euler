import Data.List
import Data.Numbers.Primes
import Control.Monad
primePermutations = filter possible $ replicateM 3 $ takeWhile (<10000) $ dropWhile (<999) primes

possible l | (x < y) && (y < z) && (permute x y z) && (continuous x y z) = True
               | otherwise = False
           where 
           x = (head l)
           y = (head (tail l))
           z = (last l)

permute x y z = ((sort . show) x) == ((sort . show) y) && ((sort . show) z) == ((sort . show) y)

continuous x y z = (z-y) == (y-x)

main :: IO()
main = print primePermutations
