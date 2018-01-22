module PrimeFactors (primeFactors) where

import Data.Numbers.Primes (primes, isPrime) -- `primes` package

primeFactors :: Integer -> [Integer]
primeFactors n
    | n <= 1    = []
    | isPrime n = [n]
    | otherwise = p : primeFactors (quot n p)
  where
    p = head [x | x <- primes, rem n x == 0]
