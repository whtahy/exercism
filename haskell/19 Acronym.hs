module Acronym (abbreviate) where

import Data.Char (isLower, isUpper, toUpper)

abbreviate :: String -> String
abbreviate s = map toUpper $ head s : (reverse $ f "" s)

f :: String -> String -> String
f acro [] = acro
f acro (x:xs)
    | null xs                 = acro
    | or [space, dash, camel] = f (head xs : acro) (tail xs)
    | otherwise               = f acro xs
  where
    space = x == ' '
    dash  = x == '-'
    camel = isLower x && isUpper (head xs)
