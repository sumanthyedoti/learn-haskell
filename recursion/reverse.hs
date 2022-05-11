reverse' li
  | null li = []
  | otherwise = reverse' (tail li) ++ [head li]

main :: IO ()
main = undefined
