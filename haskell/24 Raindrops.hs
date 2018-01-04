module Raindrops (convert) where

convert :: Int -> String
convert x
    | null s    = show x
    | otherwise = s
  where
    s = f x 3 "Pling" ++ f x 5 "Plang" ++ f x 7 "Plong"

f :: Int -> Int -> String -> String
f x y z
    | rem x y == 0 = z
    | otherwise    = []
