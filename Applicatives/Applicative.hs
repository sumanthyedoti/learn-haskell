-- What if we have a functor value of Just (3 *) and a functor value of Just 5
--  and we want to take out the function from Just (3 *) and map it over Just 5?
--
-- We could pattern-match against the Just constructor to get the function
--  out of functor
applicative :: Maybe (a -> a) -> Maybe a -> Maybe a
applicative ff fv =
  case ff of
    Just f -> fmap f fv
    _ -> Nothing

rx = applicative (Just (+ 3)) (Just 10)

-- but we're want more general and abstract way of doing that,
--  which works across functors
{-
      class (Functor f) => Applicative f where
        pure :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b
-- pure should take a value of any type and return an applicative functor
    with that value inside it
-- <*> takes a functor that has a function in it and another functor and
    sort of extracts that function from the first functor and then maps
    it over the second one
-- Maybe
    instance Applicative Maybe where
      pure = Just
      Nothing <*> _ = Nothing
      (Just f) <*> something = fmap f something
-}
rx2 = Just (+ 3) <*> Just 10

rx3 = pure (+ 3) <*> Just 10

rx3' = fmap (+ 3) $ Just 10

-- pure f <*> x equals fmap f x
-- pure puts a value in a default context. If we just put a function in
--  a default context and then extract and apply it to a value inside
--  another applicative functor,
fa = pure (+) <*> Just 2 <*> Just 10

-- Control.Applicative exports a function called <$>, which is just
--  fmap as an infix operator
fa' = (+) <$> Just 2 <*> Just 10

fa2 = (++) <$> Just "Hello " <*> Just "World!"

main :: IO ()
main = undefined
