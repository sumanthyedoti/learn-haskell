quicksort [] = []
quicksort (h:xs) =
  let smallerSorted = quicksort [x | x <- xs, x <= h]
      biggerSorted = quicksort [x | x <- xs, x > h]
   in smallerSorted ++ [h] ++ biggerSorted

main :: IO ()
main = undefined
