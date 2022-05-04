max' :: (Ord a) => [a] -> a
max' xs =
  case xs of
    [] -> error "the list is empty to find the max"
    [x] -> x
    (x:xs) -> max x (max' xs)

main :: IO ()
main = return ()
