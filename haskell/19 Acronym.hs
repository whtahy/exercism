module Acronym (abbreviate) where

import Data.Char (toUpper)

abbreviate :: String -> String
abbreviate s = map toUpper $ head s : f "" s

f :: String -> String -> String
f acro [] = acro
f acro (x:xs)
    | null xs                 = acro
    | or [space, dash, camel] = f (acro ++ [head xs]) xs
    | otherwise               = f acro xs
  where
    space = x == ' '
    dash  = x == '-'
    camel = elem x ['a'..'z'] && elem (head xs) ['A'..'Z']
