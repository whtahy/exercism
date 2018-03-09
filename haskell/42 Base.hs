module Base (rebase) where

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase bIn bOut ls
    | bIn <= 1        = Nothing
    | bOut <= 1       = Nothing
    | any (< 0) ls    = Nothing
    | any (>= bIn) ls = Nothing
    | otherwise       = Just . toBase bOut . base10 bIn $ ls


base10 :: Integral a => a -> [a] -> a
base10 b ls = f 0 $ reverse ls
  where
    f i []     = 0
    f i (x:xs) = x * b ^ i + f (i + 1) xs

toBase :: Integral a => a -> a -> [a]
toBase b n
    | n <= 0    = []
    | otherwise = toBase b (quot n b) ++ [rem n b]
