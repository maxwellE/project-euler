tri = map (\n -> (n * (n+1)) `div` 2) [1..]
pen = map (\n -> (n * (3*n-1)) `div` 2) [1..]
hex = map (\n -> (n * (2*n-1))) [1..]

merge a@(x:xs) b@(y:ys)
 | x == y = x : merge xs ys
 | x <  y = merge xs b
 | True   = merge a ys

main = print $ pen `merge` hex !! 2
