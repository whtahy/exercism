module Isogram (isIsogram) where

import Data.Char (toLower)

isIsogram :: String -> Bool
isIsogram = f (flip elem ['a' .. 'z']) . map toLower

f :: Eq a => (a -> Bool) -> [a] -> Bool
f cond [] = True
f cond (x:xs)
    | cond x && elem x xs = False
    | otherwise           = f cond xs
