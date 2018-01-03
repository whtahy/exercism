module IsbnVerifier
  ( isbn
  ) where

isbn :: String -> Bool
isbn s
    | valid     = rem (dotProd coeff x) 11 == 0
    | otherwise = False
  where
    x     = parse s
    coeff = [10, 9 .. 1]
    valid = null (drop 10 x) && notElem 10 (init x)

parse :: String -> [Int]
parse [] = []
parse (x:xs)
    | elem x ['0' .. '9'] = read [x] : parse xs
    | elem x ['X']        = 10 : parse xs
    | otherwise           = parse xs

dotProd :: Num a => [a] -> [a] -> a
dotProd a b = sum $ zipWith (*) a b
