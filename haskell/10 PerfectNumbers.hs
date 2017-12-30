module PerfectNumbers
  ( classify
  , Classification(..)
  ) where

data Classification
  = Deficient
  | Perfect
  | Abundant
  deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
    | n <= 0 = Nothing
    | m <  n = Just Deficient
    | m == n = Just Perfect
    | m >  n = Just Abundant
  where
    m = sum $ divisors n

-- Credit to https://github.com/Ian-Grant
-- Adapted from https://git.io/vbN6A
divisors :: Int -> [Int]
divisors 1 = [0]
divisors n = filter ((== 0) . rem n) [1 .. quot n 2]
