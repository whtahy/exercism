-- Credit to https://github.com/Average-user
-- Adapted from https://git.io/vbbYK

module RailFenceCipher
  ( encode
  , decode
  ) where

import Data.List (sortOn)

encode :: Int -> [a] -> [a]
encode n s = f ss
  where
    ss = zip p s
    p  = cycle $ ii ++ reverse (drop 1 $ init ii)
    ii = [1 .. n]

decode :: Int -> [a] -> [a]
decode n s = f ss
  where
    ss = zip p s
    p  = encode n ii
    ii = [1 .. length s]

f :: Ord a => [(a, b)] -> [b]
f x = map snd $ sortOn fst x
