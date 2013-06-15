numberToWord :: Int -> [Char]
numberToWord n | n < 100 = (lessThan100Number n)
               | n < 200 = "onehundred" ++ (nextSuffix $ n `mod` 100)
               | n < 300 = "twohundred" ++ (nextSuffix $ n `mod` 200)
               | n < 400 = "threehundred" ++ (nextSuffix $ n `mod` 300)
               | n < 500 = "fourhundred" ++ (nextSuffix $ n `mod` 400)
               | n < 600 = "fivehundred" ++ (nextSuffix $ n `mod` 500)
               | n < 700 = "sixhundred" ++ (nextSuffix $ n `mod` 600)
               | n < 800 = "sevenhundred" ++ (nextSuffix $ n `mod` 700)
               | n < 900 = "eighthundred" ++ (nextSuffix $ n `mod` 800)
               | n < 1000 = "ninehundred" ++ (nextSuffix $ n `mod` 900)
               | otherwise = "onethousand"



lessThan100Number :: Int -> [Char]
lessThan100Number n | n < 10 = lessThan10Number n
                    | n < 20 = teenNumber n
                    | n < 30 = "twenty" ++ (lessThan10Number $ n `mod` 20)
                    | n < 40 = "thirty" ++ (lessThan10Number $ n `mod` 30)
                    | n < 50 = "forty" ++ (lessThan10Number $ n `mod` 40)
                    | n < 60 = "fifty" ++ (lessThan10Number $ n `mod` 50)
                    | n < 70 = "sixty" ++ (lessThan10Number $ n `mod` 60)
                    | n < 80 = "seventy" ++ (lessThan10Number $ n `mod` 70)
                    | n < 90 = "eighty" ++ (lessThan10Number $ n `mod` 80)
                    | otherwise = "ninety" ++ (lessThan10Number $ n `mod` 90)

nextSuffix :: Int -> [Char]
nextSuffix 0 = ""
nextSuffix n   | n < 10 = "and" ++ (lessThan10Number n)
               | n < 20 = "and" ++ (teenNumber n)
               | n < 30 = "andtwenty" ++ (lessThan10Number $ n `mod` 20)
               | n < 40 = "andthirty" ++ (lessThan10Number $ n `mod` 30)
               | n < 50 = "andforty" ++ (lessThan10Number $ n `mod` 40)
               | n < 60 = "andfifty" ++ (lessThan10Number $ n `mod` 50)
               | n < 70 = "andsixty" ++ (lessThan10Number $ n `mod` 60)
               | n < 80 = "andseventy" ++ (lessThan10Number $ n `mod` 70)
               | n < 90 = "andeighty" ++ (lessThan10Number $ n `mod` 80)
               | otherwise = "andninety" ++ (lessThan10Number $ n `mod` 90)



teenNumber :: Int -> [Char]
teenNumber 10 = "ten"
teenNumber 11 = "eleven"
teenNumber 12 = "twelve"
teenNumber 13 = "thirteen"
teenNumber 14 = "fourteen"
teenNumber 15 = "fifteen"
teenNumber 16 = "sixteen"
teenNumber 17 = "seventeen"
teenNumber 18 = "eighteen"
teenNumber 19 = "nineteen"

lessThan10Number :: Int -> [Char]
lessThan10Number 9 = "nine"
lessThan10Number 8 = "eight"
lessThan10Number 7 = "seven"
lessThan10Number 6 = "six"
lessThan10Number 5 = "five"
lessThan10Number 4 = "four"
lessThan10Number 3 = "three"
lessThan10Number 2 = "two"
lessThan10Number 1 = "one"
lessThan10Number 0 = ""

main :: IO()
main = print $ sum $ map(length . numberToWord)[1..1000]
