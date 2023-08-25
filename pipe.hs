import Data.Function

x = (map (* 2) . (filter odd)) [1, 2, 3, 4, 5, 6]

main :: IO ()
main = undefined
