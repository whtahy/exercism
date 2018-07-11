module Series (largestProduct) where

import Data.Char (isDigit, digitToInt)

largestProduct :: Int -> String -> Maybe Integer
largestProduct n s = valid n s >>= Just . f n 0

f :: Int -> Integer -> [Integer] -> Integer
f n acc ls
    | null x       = p
    | n > length x = acc
    | p > acc      = f n p t
    | otherwise    = f n acc t
  where
    x = take n ls
    p = product x
    t = drop 1 ls

valid :: Int -> String -> Maybe [Integer]
valid n s
    | n < 0         = Nothing
    | n > length s  = Nothing
    | all isDigit s = Just . map (toInteger . digitToInt) $ s
    | otherwise     = Nothing
