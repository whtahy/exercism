module DNA
  ( nucleotideCounts
  ) where

import            Data.Map.Strict  (Map)
import qualified  Data.Map.Strict  as Map

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts = iter blank
  where
    blank = Map.fromList $ zip ['A', 'C', 'G', 'T'] $ repeat 0

iter :: (Ord k, Num a) => Map k a -> [k] -> Either String (Map k a)
iter mp [] = Right mp
iter mp (x:xs)
    | Map.member x mp = iter (incr x mp) xs
    | otherwise       = Left "error string"

incr :: (Ord k, Num a) => k -> Map k a -> Map k a
incr = Map.adjust (1 +)
