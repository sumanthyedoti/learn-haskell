-- only type constructors that take exactly one parameter can be made
--  an instance of Functor
newtype Pair b a =
  Pair
    { getPair :: (a, b)
    }

{-
 - now we can pattern match on types defined with newtype. We pattern match to
 - get the underlying tuple, then we apply the function f to the first component
 - in the tuple and then we use the Pair value constructor to convert the
 - tuple back to our Pair b a
 -}
instance Functor (Pair c) where
  fmap f (Pair (x, y)) = Pair (f x, y)

ft = getPair $ fmap (* 100) (Pair (2, 3)) -- (200, 3)
