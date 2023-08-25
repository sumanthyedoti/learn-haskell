factorial :: Int -> Int
factorial 1 = 1
factorial n = product [1 .. n]
