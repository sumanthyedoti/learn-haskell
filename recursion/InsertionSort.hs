module InsertionSort where

insert a [] = [a]
insert a xs@(x:xs')
  | a < x = a : xs
  | otherwise = x : insert a xs'

insertionSort [] = []
insertionSort (x:xs) = insert x $ insertionSort xs

main :: IO ()
main = undefined
