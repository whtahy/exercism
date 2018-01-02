module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n

squareOfSums :: Integral a => a -> a
squareOfSums n = (^2) $ quot (n * (n+1)) 2

sumOfSquares :: Integral a => a -> a
sumOfSquares n = quot (n * (n+1) * (2*n+1)) 6