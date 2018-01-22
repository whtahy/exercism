module Meetup
    ( Weekday(..)
    , Schedule(..)
    , meetupDay
    ) where

import Data.Time.Calendar

data Weekday
    = Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday
    deriving (Eq, Show)

data Schedule
    = First
    | Second
    | Third
    | Fourth
    | Last
    | Teenth
    deriving (Eq, Show)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = ModifiedJulianDay $ find schedule d
  where
    a = toModifiedJulianDay $ fromGregorian year month 1
    n = fromIntegral $ gregorianMonthLength year month

    s  = [a .. (a+n-1)]
    s' = take 7 $ drop 12 s -- teenth

    f x = [q | q <- x, rem q 7 == index weekday]

    d =
        if schedule == Teenth
        then f s'
        else f s

find :: Schedule -> [Integer] -> Integer
find First  = head
find Second = flip (!!) 1
find Third  = flip (!!) 2
find Fourth = flip (!!) 3
find Last   = last
find Teenth = head

index :: Weekday -> Integer
index Wednesday = 0 -- MJD starts on Wed, 1858-11-17
index Thursday  = 1
index Friday    = 2
index Saturday  = 3
index Sunday    = 4
index Monday    = 5
index Tuesday   = 6
