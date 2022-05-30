mul n x =
  if n > 0
    then Just $ x * n
    else Nothing

x1 = mul 2 10 >>= mul 2 >>= mul 4

{- == do block == -}
-- what if we need computation of previous monadic values
-- nested use of >>=
x2 = mul 2 10 >>= \x -> mul x 4 >>= \y -> Just $ x + y

-- do notation
xdo :: Maybe Integer
xdo = do
  x <- mul 2 10
  y <- mul 4 x >>= mul 1
  return $ x + y

{- ability to temporarily extract things from Maybe values without having
 - to check if the Maybe values are Just values or Nothing values at every step.
 - If any of the values that we try to extract from are Nothing,
 - the whole do expression will result in a Nothing
 -}
faildo = do
  x <- mul 2 10
  y <- mul 4 x >>= mul (-1)
  Just $ x + y

-- eg2
foo, mfoo :: Maybe String
foo = Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))

mfoo = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)
