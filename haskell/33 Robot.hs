module Robot
    ( Bearing(East, North, South, West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

import Data.List (foldl')

data Bearing
    = North
    | East
    | South
    | West
    deriving (Eq, Show)

data Robot = Robot
    { bearing     :: Bearing
    , coordinates :: (Integer, Integer)
    } deriving (Show)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

simulate :: Robot -> String -> Robot
simulate = foldl' move

move :: Robot -> Char -> Robot
move (Robot dir loc) ch
    | ch == 'L' = Robot (turnLeft  dir) loc
    | ch == 'R' = Robot (turnRight dir) loc
    | ch == 'A' = advance $ Robot dir loc
    | otherwise = error "Invalid instruction Char."

advance :: Robot -> Robot
advance (Robot dir (x, y))
    | dir == North = Robot dir (x, y+1)
    | dir == South = Robot dir (x, y-1)
    | dir == East  = Robot dir (x+1, y)
    | dir == West  = Robot dir (x-1, y)

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft West  = South
turnLeft South = East
turnLeft East  = North

turnRight :: Bearing -> Bearing
turnRight North = East
turnRight East  = South
turnRight South = West
turnRight West  = North
