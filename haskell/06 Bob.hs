module Bob
  ( responseFor
  ) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor s
    | pause          = "Fine. Be that way!"
    | query && shout = "Calm down, I know what I'm doing!"
    | query          = "Sure."
    | shout          = "Whoa, chill out!"
    | otherwise      = "Whatever."
  where
    x     = filter (not . isSpace) s
    pause = null x
    query = last x == '?'
    shout = any isAlpha x && (all isUpper . filter isAlpha) x
