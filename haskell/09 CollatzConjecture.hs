module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
    | n <= 0    = Nothing
    | otherwise = Just $ f 0 n

f :: Integer -> Integer -> Integer
f n 1 = n
f n x
    | even x    = f (n+1) (quot x 2)
    | otherwise = f (n+1) (3*x+1)
