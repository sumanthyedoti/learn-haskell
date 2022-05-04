replicate' n a
  | n < 0 = error "can not a list of negative size"
  | n == 0 = []
  | otherwise = a : replicate' (n - 1) a

main :: IO ()
main = undefined
