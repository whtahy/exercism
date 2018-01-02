module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance = ham 0

ham n [] [] = Just n
ham n [] _  = Nothing
ham n _  [] = Nothing
ham n (x:xs) (y:ys)
    | x /= y    = ham (n+1) xs ys
    | otherwise = ham n xs ys
