module School
  ( School
  , add
  , empty
  , grade
  , sorted
  ) where

-- add containers to package.yaml

import            Data.List        (sort)
import            Data.Map.Strict  (Map)
import qualified  Data.Map.Strict  as Map
import            Data.Maybe       (fromJust, isNothing)

type School = Map Int [String]

add :: Int -> String -> School -> School
add k v m = Map.insert k x r
  where
    x = sort . fromJust $ Map.lookup k r
    r = Map.insertWith (++) k [v] m

empty :: School
empty = Map.empty

grade :: Int -> School -> [String]
grade k m
    | isNothing x = []
    | otherwise   = fromJust x
  where
    x = Map.lookup k m

sorted :: School -> [(Int, [String])]
sorted = Map.toList
