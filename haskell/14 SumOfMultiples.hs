module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples nn m = sum $ map (f nn) [1 .. m-1]
  where
    f nn i
        | elem 0 $ map (rem i) nn = i
        | otherwise               = 0
