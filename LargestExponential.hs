import Data.Functor
import Data.List
import System.IO
readLines :: FilePath -> IO [String]
readLines = fmap(lines) . readFile

createPowerList lst = cPList lst []
                      where cPList l res | (null l) = res
                                         | otherwise = cPList (tail l) (newTuple : res)
                                         where newTuple = (createPowers (head l) ((length res)+1))

createPowers lst indx = (((a^b),indx))
               where 
               a' = takeWhile (/=',') lst
               a = read a' :: Integer
               b' =  drop 1 $ dropWhile (/= ',') lst
               b = read b' :: Integer

main :: IO()
main = do 
          res <- (maximum . createPowerList) <$> readLines "base_exp.txt" 
          print (snd res)
