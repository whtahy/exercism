module ProteinTranslation
  ( proteins
  ) where

import Data.Maybe      (fromJust, isNothing)
import Data.List.Split (chunksOf)

data Codon
  = Methionine
  | Phenylalanine
  | Leucine
  | Serine
  | Tyrosine
  | Cysteine
  | Tryptophan
  | Stop
  deriving (Eq, Show)

proteins :: String -> Maybe [String]
proteins s = foo [] $ chunksOf 3 s

foo :: [String] -> [String] -> Maybe [String]
foo ls [] = Just ls
foo ls (x:xs)
    | isNothing s    = Nothing
    | s == Just Stop = Just ls
    | otherwise      = foo (ls ++ [(show . fromJust) s]) xs
  where s = translate x

translate :: String -> Maybe Codon
translate s
    | f ["AUG"]                      = Just Methionine
    | f ["UUU", "UUC"]               = Just Phenylalanine
    | f ["UUA", "UUG"]               = Just Leucine
    | f ["UCU", "UCC", "UCA", "UCG"] = Just Serine
    | f ["UAU", "UAC"]               = Just Tyrosine
    | f ["UGU", "UGC"]               = Just Cysteine
    | f ["UGG"]                      = Just Tryptophan
    | f ["UAA", "UAG", "UGA"]        = Just Stop
    | otherwise                      = Nothing
  where f = elem s
