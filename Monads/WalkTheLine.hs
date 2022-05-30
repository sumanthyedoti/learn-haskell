{-
 - we took some functions that we had and saw that they would work better
 - if the values that they returned supported failure. By turning those values
 - into Maybe values and replacing normal function application with >>=,
 - we got a mechanism for handling failure pretty much for free,
 - because >>= is supposed to preserve the context of the value to which
 - it applies functions. In this case, the context was that our values were
 - values with failure and so when we applied functions to such values,
 - the possibility of failure was always taken into account
 -}
type Birds = Int

type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((left + n) - right) <= 3 = Just (left + n, right)
  | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
  | abs (left - (right + n)) <= 3 = Just (left, right + n)
  | otherwise = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

walk1 = landRight 2 (0, 0) >>= landLeft 1 >>= landLeft 2

walk2 = landRight 3 (0, 0) >>= landLeft 6 >>= landRight (-1)

walk3 = landRight 3 (0, 0) >>= banana >>= landLeft 6 >>= landRight (-1)

-- do notation
dowalk = do
  s1 <- landRight 1 (0, 0)
  s2 <- landLeft 1 s1
  landRight 1 s2

dofall = do
  s1 <- landRight 1 (0, 0)
  s2 <- landLeft 1 s1
  s3 <- banana s2
  landRight 1 s2
