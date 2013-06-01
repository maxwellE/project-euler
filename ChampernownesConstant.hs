import Data.List
import Data.Char
eulerDecStr = createDecStr "." 1
createDecStr str val | (length str) > 1000001 = str
                     | otherwise = createDecStr (str ++ (show val)) (val+1)

champConstant = (digitToInt $ decStr !! 1) * (digitToInt $ decStr !! 10) * (digitToInt $ decStr !! 100) * (digitToInt $ decStr !! 1000) * (digitToInt $ decStr !! 10000) * (digitToInt $ decStr !! 100000) * (digitToInt $ decStr !! 1000000)
                where
                decStr = eulerDecStr

main :: IO()
main = print $ champConstant
