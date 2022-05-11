elem' a [] = False
elem' a (x:xs)
  | a == x = True
  | otherwise = a `elem` xs

main :: IO ()
main = undefined
