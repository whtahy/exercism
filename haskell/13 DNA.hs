-- Credit to https://github.com/corneliusweig via https://github.com/jmg-duarte
-- Adapted from http://exercism.io/submissions/6e8c7d24774d407c9993a812f4f48b0c

module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM $ flip lookup (zip "GCTA" "CGAU")
