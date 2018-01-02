module Isogram (isIsogram) where

isIsogram :: String -> Bool
isIsogram = f (flip elem low) . map lower

f :: Eq a => (a -> Bool) -> [a] -> Bool
f cond [] = True
f cond (x:xs)
    | cond x && elem x xs = False
    | otherwise           = f cond xs

-- Note that Data.Char.toLower is better
lower :: Char -> Char
lower ch
    | elem ch upp = snd . head $ filter ((== ch) . fst) p
    | otherwise   = ch
  where
    p = zip upp low

upp = ['A' .. 'Z']
low = ['a' .. 'z']
