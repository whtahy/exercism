module Scrabble (scoreLetter, scoreWord) where

import Data.Char  (toUpper)
import Data.Maybe (fromJust, isNothing)

scoreLetter :: Char -> Integer
scoreLetter ch
    | isNothing x = 0
    | otherwise   = fromJust x
    where x = flip lookup vals $ toUpper ch

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter

vals :: [(Char, Integer)]
vals = concatMap f v
  where
    f (a, b) = zip b $ repeat a
    v =
        [ (1 , "AEIOULNRST")
        , (2 , "DG")
        , (3 , "BCMP")
        , (4 , "FHVWY")
        , (5 , "K")
        , (8 , "JX")
        , (10, "QZ")
        ]
