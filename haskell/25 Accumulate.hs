module Accumulate (accumulate) where

-- restrictions: no map, fmap, etc
accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] = []
accumulate f (x:xs) = f x : accumulate f xs
