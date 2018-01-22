module Roman (numerals) where

numerals :: Integer -> Maybe String
numerals n
    | n <= 0    = Nothing
    | otherwise = Just . concat $ f n dict

f :: Integer -> [(Integer, String)] -> [String]
f n [] = []
f n ((i,s):xs) = replicate r s ++ f n' xs
  where
    r  = fromIntegral $ div n i
    n' = rem n i

dict =
    reverse
    [ (   1,  "I")
    , (   4, "IV")
    , (   5,  "V")
    , (   9, "IX")
    , (  10,  "X")
    , (  40, "XL")
    , (  50,  "L")
    , (  90, "XC")
    , ( 100,  "C")
    , ( 400, "CD")
    , ( 500,  "D")
    , ( 900, "CM")
    , (1000,  "M")
    ]
