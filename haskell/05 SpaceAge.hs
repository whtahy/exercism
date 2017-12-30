module SpaceAge
  ( Planet(..)
  , ageOn
  ) where

data Planet =
    Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

-- earth-year / planet-year
period :: Planet -> Float
period Mercury = 0.2408467
period Venus   = 0.61519726
period Earth   = 1
period Mars    = 1.8808158
period Jupiter = 11.862615
period Saturn  = 29.447498
period Uranus  = 84.016846
period Neptune = 164.79132

ageOn :: Planet -> Float -> Float
-- sec * (earth-year / sec) * (planet-year / earth-year) -> planet-year
ageOn planet sec = sec * (1 / p) * (1 / period planet)
  where
    p = 31557600 -- sec / earth-year
