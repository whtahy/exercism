module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA s
    | elem qq r = Nothing
    | otherwise = Just r
  where
    r = map f s

f x
    | x == 'G'  = 'C'
    | x == 'C'  = 'G'
    | x == 'T'  = 'A'
    | x == 'A'  = 'U'
    | otherwise = qq

qq = '!' -- wildcard
