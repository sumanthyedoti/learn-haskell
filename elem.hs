elem' a [] = False
elem' a (x:xs)
  | a == x = True
  | otherwise = elem a xs

main :: IO ()
main = undefined
