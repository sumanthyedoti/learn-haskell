{-|
 - Functor is any type either pure or impure which is mappable
 - Functor helps to apply pure functions to impure values
 - 'fmap' takes a function and applies the function to the values in Functor
 - without 'fmap' we need to unwrap 'Just'
-}
ex1 = fmap (+ 1) (Just 10)

ex1'2 = (+ 1) <$> (Just 10)

-- map on list of Maybe types
ex2 = map (fmap (* 2)) [Just 2, Just 4, Just 7, Just 9]

ex3 = fmap ("Hello " ++) getLine

main :: IO ()
main = undefined
