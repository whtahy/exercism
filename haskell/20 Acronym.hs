module Acronym (abbreviate) where

abbreviate :: String -> String
abbreviate s = map toUpp $ head s : f "" s

f :: String -> String -> String
f acro [] = acro
f acro (x:xs)
    | null xs                 = acro
    | or [space, dash, camel] = f (acro ++ [head xs]) xs
    | otherwise               = f acro xs
  where
    space = x == ' '
    dash  = x == '-'
    camel = elem x low && elem (head xs) upp

-- prelude only just for fun
toUpp ch
    | elem ch low = snd .head $ filter ((== ch) . fst) $ zip low upp
    | otherwise   = ch
low = ['a'..'z']
upp = ['A'..'Z']
