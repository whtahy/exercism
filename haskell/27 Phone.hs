module Phone (number) where

import Data.Char  (isDigit)
import Data.Maybe (isNothing, fromJust)

number :: String -> Maybe String
number = foo . bar . filter isDigit

bar :: String -> Maybe String
bar s
    | len == 10                  = Just s
    | len == 11 && head s == '1' = Just $ tail s
    | otherwise                  = Nothing
  where
    len = length s

foo :: Maybe String -> Maybe String
foo s
    | isNothing s   = Nothing
    | all f [0, 3]  = s
    | otherwise     = Nothing
  where
    f i = flip notElem ['0', '1'] $ fromJust s !! i
