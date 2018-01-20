-- Credit to https://github.com/cmears
-- Adapted from http://exercism.io/submissions/a884666935564b279d9cc95323f59f61

module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor s = filter (f s)

f :: String -> String -> Bool
f x y = x' /= y' && sort x' == sort y'
  where
    x' = map toLower x
    y' = map toLower y
