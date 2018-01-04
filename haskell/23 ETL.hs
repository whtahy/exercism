module ETL (transform) where

import            Data.Char        (toLower)
import            Data.Map.Strict  (Map)
import qualified  Data.Map.Strict  as Map

transform :: Map Int String -> Map Char Int
transform = Map.fromList . f . Map.toList

f [] = []
f (x:xs) = zip b a ++ f xs
  where
    a = repeat $ fst x
    b = map toLower $ snd x
