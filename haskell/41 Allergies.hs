-- Credit to https://github.com/rbasso
-- Adapted from https://git.io/vNwIE (official solution)

module Allergies
    ( Allergen(..)
    , allergies
    , isAllergicTo
    ) where

import Data.Bits (testBit)

data Allergen
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats
    deriving (Enum, Eq, Show)

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo a x = testBit x a' -- x contains a
  where
    a' = fromEnum a

allergies :: Int -> [Allergen]
allergies n = filter f [toEnum 0 ..]
  where
    f = flip isAllergicTo n
