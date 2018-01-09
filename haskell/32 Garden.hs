module Garden
    ( Plant(..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import            Data.List        (sort)
import            Data.List.Split  (chunksOf)
import            Data.Map.Strict  (Map)
import qualified  Data.Map.Strict  as Map
import            Data.Maybe       (fromJust)

data Plant
    = Clover
    | Grass
    | Radishes
    | Violets
    deriving (Eq, Show)

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden k
  where
    k =
        [ "Alice"
        , "Bob"
        , "Charlie"
        , "David"
        , "Eve"
        , "Fred"
        , "Ginny"
        , "Harriet"
        , "Ileana"
        , "Joseph"
        , "Kincaid"
        , "Larry"
        ]

garden :: [String] -> String -> Map String [Plant]
garden k v = Map.fromList $ zip (sort k) (parse v)

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants k m = fromJust $ Map.lookup k m

parse :: String -> [[Plant]]
parse s = map f x
  where
    f     = map $ fromJust . flip lookup m
    m     = zip "CGRV" [Clover, Grass, Radishes, Violets]
    x     = zipWith (++) a b
    [a,b] = map (chunksOf 2) $ lines s