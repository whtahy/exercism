module Strain
  ( keep
  , discard
  ) where

-- restriction: no filter, etc

discard :: (a -> Bool) -> [a] -> [a]
discard f ls = [x | x <- ls, not $ f x]

keep :: (a -> Bool) -> [a] -> [a]
keep f ls = [x | x <- ls, f x]
