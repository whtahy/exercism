-- Credit to https://github.com/sangeetkar
-- Adapted from http://exercism.io/submissions/c0180750949b4d67b9cf86f5791f1d19

module ListOps
    ( length
    , reverse
    , map
    , filter
    , foldr
    , foldl'
    , (++)
    , concat
    ) where

import Prelude hiding ((++), concat, filter, foldr, length, map, reverse)

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl' f acc' xs
  where
    acc' = acc `seq` x `seq` f acc x

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ acc [] = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

length :: [a] -> Int
length = foldl' f' 0
  where
    f' x _ = x + 1

reverse :: [a] -> [a]
reverse = foldl' f' []
  where
    f' = flip (:)

map :: (a -> b) -> [a] -> [b]
map f = foldr f' []
  where
    f' = (:) . f

filter :: (a -> Bool) -> [a] -> [a]
filter f = foldr f' []
  where
    f' x =
        if f x
        then (:) x
        else id

(++) :: [a] -> [a] -> [a]
(++) = flip $ foldr (:)

concat :: [[a]] -> [a]
concat = foldr (++) []
