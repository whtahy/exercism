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

fetch :: Int -> Char
fetch i = toEnum $ i + fromEnum 'A'

index :: Char -> Int
index c = fromEnum c - fromEnum 'A'
