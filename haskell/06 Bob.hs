module Bob
  ( responseFor
  ) where

responseFor :: String -> String
responseFor s
    | query s && yell s = "Calm down, I know what I'm doing!"
    | query s           = "Sure."
    | yell s            = "Whoa, chill out!"
    | pause s           = "Fine. Be that way!"
    | otherwise         = "Whatever."

query :: String -> Bool
query [] = False
query s
    | not (null q) = head q == '?'
    | otherwise    = False
    where q = strip $ reverse s

yell :: String -> Bool
yell s = a && b
  where
    a = find ['a' .. 'z'] False s
    b = find ['A' .. 'Z'] True s
    find ls b [] = not b
    find ls b (x:xs)
        | elem x ls = b
        | otherwise = find ls b xs

pause :: String -> Bool
pause [] = True
pause (x:xs)
    | elem x wh = pause xs
    | otherwise = False
    where wh = [' ', '\t', '\r', '\n', '\f']

strip :: String -> String
strip [] = []
strip (x:xs)
    | x == ' '  = strip xs
    | otherwise = x : xs
