-- Credit to https://github.com/fintara
-- Adapted from http://exercism.io/submissions/1af012d2e1014a57b4931c7a7e1d99f3

module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM f
  where
    f 'G' = Just 'C'
    f 'C' = Just 'G'
    f 'T' = Just 'A'
    f 'A' = Just 'U'
    f _   = Nothing
