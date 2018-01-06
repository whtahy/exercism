module TwelveDays
  ( recite
  ) where

recite :: Int -> Int -> [String]
recite start stop = map verse [start .. stop]

verse :: Int -> String
verse i = prefix i ++ " " ++ suffix i ++ "."

prefix :: Int -> String
prefix i = a ++ x ++ b
  where
    x = " " ++ days !! (i - 1) ++ " "
    a = "On the"
    b = "day of Christmas my true love gave to me,"

suffix :: Int -> String
suffix i = join . reverse $ take i gifts

join :: [String] -> String
join []     = []
join [x]    = x
join [x,y]  = x ++ ", and " ++ y
join (x:xs) = x ++ ", " ++ join xs

days :: [String]
days =
    [ "first"
    , "second"
    , "third"
    , "fourth"
    , "fifth"
    , "sixth"
    , "seventh"
    , "eighth"
    , "ninth"
    , "tenth"
    , "eleventh"
    , "twelfth"
    ]

gifts :: [String]
gifts =
    [ "a Partridge in a Pear Tree"
    , "two Turtle Doves"
    , "three French Hens"
    , "four Calling Birds"
    , "five Gold Rings"
    , "six Geese-a-Laying"
    , "seven Swans-a-Swimming"
    , "eight Maids-a-Milking"
    , "nine Ladies Dancing"
    , "ten Lords-a-Leaping"
    , "eleven Pipers Piping"
    , "twelve Drummers Drumming"
    ]
