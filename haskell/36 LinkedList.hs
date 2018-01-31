module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

import Prelude (Bool(..), Eq, Show, error, foldr)

data LinkedList a
    = Nil | Node a (LinkedList a)
    deriving (Eq, Show)

datum :: LinkedList a -> a
datum Nil = error "LinkedList is Nil." -- credit to https://github.com/jwg4
datum (Node head _) = head

fromList :: [a] -> LinkedList a
fromList = foldr Node Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _   = False

new :: a -> LinkedList a -> LinkedList a
new = Node

next :: LinkedList a -> LinkedList a
next Nil = error "LinkedList is Nil."
next (Node _ tail) = tail

nil :: LinkedList a
nil = Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = f Nil
  where
    f ll Nil = ll
    f ll (Node head tail) = f (Node head ll) tail

toList :: LinkedList a -> [a]
toList Nil = []
toList (Node head tail) = head : toList tail
