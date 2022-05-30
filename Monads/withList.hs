import Data.Monoid

mul n x =
  if n > 0
    then Just $ x * n
    else Nothing

ls = [Just 2, Nothing, Just 4, Just 3, Nothing, Just 5]

monadLs = fmap (>>= mul 3) ls

lsSum = mconcat $ fmap Sum <$> monadLs
