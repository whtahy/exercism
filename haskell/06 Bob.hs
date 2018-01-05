module Bob
  ( responseFor
  ) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor s
    | q && y    = "Calm down, I know what I'm doing!"
    | q         = "Sure."
    | y         = "Whoa, chill out!"
    | p         = "Fine. Be that way!"
    | otherwise = "Whatever."
  where
    q = query s
    y = yell  s
    p = pause s

query :: String -> Bool
query s = check (== '?') x
  where
    x = filter (not . isSpace) $ dropWhile (/= '?') s

yell :: String -> Bool
yell s = check isUpper x
  where
    x = filter isAlpha s

pause :: String -> Bool
pause = all isSpace

check :: Foldable t => (a -> Bool) -> t a -> Bool
check f x = all f x && not (null x) -- at least 1
