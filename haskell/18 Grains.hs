module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
    | n <= 0    = Nothing
    | n >= 65   = Nothing
    | otherwise = Just $ 2 ^ (n-1)

total :: Integer
total = 18446744073709551615 -- ie, 2^64 - 1 (geometric series)
