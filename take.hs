take' n li
  | n <= 0 || null li = []
  | otherwise = head li : take' (n - 1) (tail li)

main :: IO ()
main = undefined
