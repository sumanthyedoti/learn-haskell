collatz 1 = [1]
collatz n
  | odd n = n : collatz (n * 3 + 1)
  | even n = n : collatz (n `div` 2)

numOfLongChains n = length [c | x <- [1 .. n], let c = collatz x, length c > 15]

main :: IO ()
main = undefined
