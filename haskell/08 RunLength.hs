module RunLength
  ( decode
  , encode
  ) where

encode :: String -> String
encode s = concat $ zipWith (++) a b
  where
    ss = split s
    a  = map (f . show . length) ss
    b  = split $ map head ss
    f x
        | x == "1"  = ""
        | otherwise = x

split :: String -> [String]
split [] = []
split s  = fst x : split (snd x)
  where
    x = span (== head s) s

decode :: String -> String
decode = make . parse

make :: [(Int, Char)] -> String
make []     = []
make (x:xs) = uncurry replicate x ++ make xs

parse :: String -> [(Int, Char)]
parse [] = []
parse s  = (a, b) : parse xs
  where
    x  = span (flip elem ['0' .. '9']) s
    a  = if null (fst x) then
            1
         else
            read $ fst x
    b  = head $ snd x
    xs = tail $ snd x
