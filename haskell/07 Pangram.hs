module Pangram
  ( isPangram
  ) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram s = all (flip elem x) ['a' .. 'z']
  where
    x = map toLower s
