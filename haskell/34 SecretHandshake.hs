module SecretHandshake (handshake) where

import Data.Bits  ((.&.))
import Data.Maybe (catMaybes)

handshake :: Int -> [String]
handshake n
    | c n r     = reverse $ foo (n - r)
    | otherwise = foo n
  where
    foo x = catMaybes $ zipWith (bar x) a b

    bar x a b
        | c x a     = Just b
        | otherwise = Nothing

    a = map (2^) [0..3]
    b = ["wink", "double blink", "close your eyes", "jump"]
    r = 16

    -- Credit to https://github.com/AndreasDL
    c x y = x .&. y == y -- x contains y
