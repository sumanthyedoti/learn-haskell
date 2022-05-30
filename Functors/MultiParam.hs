-- when functions are mapped over functors, functions that take one parameter.
-- But what happens when we map a function like *,
-- which takes two parameters, over a functor?
eg1 = fmap (*) (Just 10) -- eg1 :: Maybe (Integer -> Integer)

eg1' = fmap (\f -> f 10) eg1

eg2 = fmap (++) ["Hey", "you"]

eg2' = fmap (\f -> f "!") eg2

eg3 = fmap (\x y z -> x * y + z) [1, 2, 3, 4]

eg3' = fmap (\f -> f 10 10) eg3

main :: IO ()
main = undefined
