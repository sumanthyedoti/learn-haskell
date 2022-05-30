-- we attach the transformation (*3) to the eventual output of (+2)
eg1 = fmap (* 3) (+ 2) $ 8

-- as infix
eg1' = (* 3) `fmap` (+ 2) $ 8

-- fmap over functions is just composition
-- fmap acts just like . for functions
eg1'1 = (* 3) . (+ 2) $ 8

-- same like
eg1'2 = (\x -> (x + 2) * 3) 8

-- lifting functions:
-- fmap as a function that takes a function and returns a new function
--   that's just like the old one, only it takes a functor as a parameter and
--   returns a functor as the result
lf :: (Functor f, Num a) => f a -> f a
lf = fmap (* 2)

main :: IO ()
main = undefined
