module Pangram
  ( isPangram
  ) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram s = and [elem i (map toLower s) | i <- ['a' .. 'z']]
