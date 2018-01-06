module RunLength
  ( decode
  , encode
  ) where

import Data.Char (isDigit)
import Data.List (group, groupBy)

decode :: String -> String
decode = f . g
  where
    g = groupBy (\x y -> all isDigit [x,y])

    f []  = []
    f [x] = x
    f (x:y:zs)
        | isDigit (head x) = replicate (read x) (head y) ++ f zs
        | otherwise        = head x : f (y:zs)

-- Credit to https://github.com/cjlarose
-- Adapted from https://git.io/vNThm
encode :: String -> String
encode s = concatMap f $ group s
  where
    f [x] = [x]
    f x   = (show . length) x ++ take 1 x
