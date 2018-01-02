module ComplexNumbers
  ( Complex
  , conjugate
  , abs
  , real
  , imaginary
  , mul
  , add
  , sub
  , div
  , complex
  ) where

import Prelude hiding (abs, div)

-- Data Definition -------------------------------------------------------------

data Complex a =
  Cx a a
  deriving (Eq, Show)

complex :: (a, a) -> Complex a
complex (x, y) = Cx x y

-- Unary Operators -------------------------------------------------------------

conjugate :: Num a => Complex a -> Complex a
conjugate (Cx x y) = Cx x (-y)

abs :: Floating a => Complex a -> a
abs (Cx x y) = sqrt $ x ** 2 + y ** 2

real :: Num a => Complex a -> a
real (Cx x _) = x

imaginary :: Num a => Complex a -> a
imaginary (Cx _ y) = y

-- Binary Operators ------------------------------------------------------------

mul :: Num a => Complex a -> Complex a -> Complex a
mul (Cx a b) (Cx c d) = Cx (a * c - b * d) (a * d + b * c)

add :: Num a => Complex a -> Complex a -> Complex a
add (Cx a b) (Cx c d) = Cx (a + c) (b + d)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Cx a b) (Cx c d) = Cx (a - c) (b - d)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Cx a b) (Cx c d) = Cx
    ((a * c + b * d) / (c ^^ 2 + d ^^ 2))
    ((b * c - a * d) / (c ^^ 2 + d ^^ 2))