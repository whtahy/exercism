module Diamond (diamond) where

diamond :: Char -> [String]
diamond ch = top ++ bot
  where
    top = map (row i) [0 .. i]
    bot = tail $ reverse top
    i   = index ch

row :: Int -> Int -> String
row n i = out ++ inn n i ++ out
  where
    out     = spa (n-i)
    inn n 0 = [fetch 0]
    inn n i = [fetch i] ++ mid ++ [fetch i]
    mid     = spa (2*i-1)
    spa x   = replicate x ' '

-- prelude only just for fun

fetch :: Int -> Char
fetch i = fst . head $ filter ((== i) . snd) mpp

index :: Char -> Int
index c = snd . head $ filter ((== c) . fst) mpp

mpp = zip upp [0..]
upp = ['A' .. 'Z']
