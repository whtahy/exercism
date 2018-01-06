module RotationalCipher (rotate) where

import Data.Char (isAlpha, isUpper, toLower, toUpper)

rotate :: Int -> String -> String
rotate n = map $ f n

f :: Int -> Char -> Char
f n ch
    | not $ isAlpha ch = ch
    | isUpper ch       = toUpper x
    | otherwise        = x
  where
    a = (fromEnum . toLower) ch - z
    b = rem (a + n) 26
    x = toEnum (b + z)
    z = fromEnum 'a'
