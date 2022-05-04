zip' xs ys
  | null xs || null ys = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

main :: IO ()
main = undefined
