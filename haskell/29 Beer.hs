module Beer (song) where

import Data.Char (toUpper)

song :: String
song = concatMap verse [start, start - 1 .. 0]

verse :: Int -> String
verse i = cap a ++ ", " ++ b ++ ".\n" ++ cap c ++ ", " ++ d ++ sep i
  where
    a = unwords [b, loc]
    b = unwords [count i, unit i, what]
    c = action i
    d = unwords [transition i, what, loc]

    what = "of beer"
    loc  = "on the wall"

    sep 0 = ".\n"
    sep _ = ".\n\n"

start :: Int
start = 99

cap :: String -> String
cap (x:xs) = toUpper x : xs

count :: Int -> String
count 0 = "no more"
count i = show i

unit :: Int -> String
unit 1 = "bottle"
unit _ = "bottles"

action :: Int -> String
action 0 = "go to the store and buy some more"
action i = unwords ["take", f i, "down and pass it around"]
  where
    f 1 = "it"
    f _ = "one"

transition :: Int -> String
transition 0 = unwords [count start, unit start]
transition 1 = unwords ["no more", unit 0]
transition i = unwords [count (i-1), unit (i-1)]
