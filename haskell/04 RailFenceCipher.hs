-- Credit to https://github.com/Average-user
-- Original solution at https://git.io/vbbYK

module RailFenceCipher
  ( encode
  , decode
  ) where

encode :: Int -> [a] -> [a]
encode n s = concat $ sort ii ss
  where
    ss = zip p s
    p  = cycle $ ii ++ reverse (drop 1 $ init ii)
    ii = [1 .. n]

decode :: Int -> [a] -> [a]
decode n s = concat $ sort ii ss
  where
    ss = zip p s
    p  = encode n ii
    ii = [1 .. length s]

sort :: [Int] -> [(Int, t)] -> [[t]]
sort ii ss = [ [ snd x | x <- ss, fst x == i ] | i <- ii ]
