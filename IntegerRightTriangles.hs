import Data.List
trianglePerimeters = [ a + b + c | a <- [1..800], b <- [1..800], c <- [1..800], (a^2 + b^2) == (c^2), (a+b+c) <= 1000]

lengthTuples = map (\x -> ((length (elemIndices x trianglePerimeters)),x)) $ trianglePerimeters 

main :: IO()
main = print $ maximum $ lengthTuples
