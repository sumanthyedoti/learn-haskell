import qualified Data.Foldable as F

{-|
 - sets and maps from Data.Set and Data.Map are implemented using trees
 - instead of normal binary search trees, they use balanced binary search trees
 - This is implementation of normal binary search tree
 - Insertion:
 -    by comparing the value we want to insert to the root node and then
 -    if it's smaller, we go left, if it's larger, we go right.
 -    We do the same for every subsequent node until we reach an empty tree.
 -    Once we've reached an empty tree, we just insert a node with that value
 -    instead of the empty tree
 - Haskell doesn't really have a concept of pointer, just values.
 -   Hence, the type for our insertion function is going to be something
 -   like a -> Tree a - > Tree a. It takes an element and a tree and
 -   returns a new tree that has that element inside
-}
data Tree a
  = Empty
  | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

-- Functor
instance Functor Tree where
  fmap f Empty = Empty
  fmap f (Node x leftsub rightsub) =
    Node (f x) (fmap f leftsub) (fmap f rightsub)

singleton :: a -> Tree a
singleton x = Node x Empty Empty

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x Empty = singleton x
treeInsert x (Node a left right)
  | x == a = Node a left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x Empty = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right

makeTree :: (Ord a) => [a] -> Tree a
makeTree = foldr treeInsert Empty

main :: IO ()
main = undefined
