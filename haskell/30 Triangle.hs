module Triangle
  ( TriangleType(..)
  , triangleType
  ) where

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Ord t, Num t) => t -> t -> t -> TriangleType
triangleType a b c
    | or  [w, x, y, z] = Illegal
    | and [ab, bc]     = Equilateral
    | or  [ab, bc, ac] = Isosceles
    | otherwise        = Scalene
  where
    w = any (<= 0) [a, b, c]
    x = a + b < c
    y = b + c < a
    z = a + c < b

    ab = a == b
    bc = b == c
    ac = a == c
