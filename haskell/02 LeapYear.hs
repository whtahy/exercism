module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
    | year <= 0 = False
    | f 400     = True
    | f 100     = False
    | f 4       = True
    | otherwise = False
  where
    f x = rem year x == 0
