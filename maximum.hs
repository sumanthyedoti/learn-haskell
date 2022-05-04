maximum' :: (Ord a) => [a] -> a
maximum' xs =
  case xs of
    [] -> error "the list is empty to find the max"
    [x] -> x
    (x:xs) -> max x (maximum' xs)

main :: IO ()
main = return ()
