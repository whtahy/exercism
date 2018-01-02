module RotationalCipher (rotate) where

rotate :: Int -> String -> String
rotate n = map $ rot n

rot :: Int -> Char -> Char
rot n ch
    | elem ch low = f n low ch
    | elem ch upp = f n upp ch
    | otherwise   = ch

f :: Int -> [Char] -> Char -> Char
f n ls ch = fetch ls $ rem (index ls ch + n) (length ls)

-- Prelude only just for fun

fetch :: [Char] -> Int -> Char
fetch ls i = fst . head $ filter ((== i) . snd) $ zip ls [0..]

index :: [Char] -> Char -> Int
index ls c = snd . head $ filter ((== c) . fst) $ zip ls [0..]

upp = ['A' .. 'Z']
low = ['a' .. 'z']
