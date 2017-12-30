module Pangram
  ( isPangram
  ) where

isPangram :: String -> Bool
isPangram s = and [ elem i (map lower s) | i <- low ]

-- Note that Data.Char.toLower is better
lower :: Char -> Char
lower ch
    | elem ch upp = head [ snd p | p <- pp, ch == fst p ]
    | otherwise   = ch
    where pp = zip upp low

low :: [Char]
low = ['a' .. 'z']

upp :: [Char]
upp = ['A' .. 'Z']
