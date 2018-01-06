-- Credit to https://github.com/rbasso
-- Adapted from https://git.io/vNvIu

module ETL (transform) where

import            Data.Char        (toLower)
import            Data.Map.Strict  (Map)
import qualified  Data.Map.Strict  as Map

transform :: Map Int String -> Map Char Int
transform = Map.fromList . concatMap f . Map.toList
  where
    f (k, v) = zip (map toLower v) (repeat k)
