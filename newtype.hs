newtype Natural =
  MakeNatural Integer
  deriving (Show, Eq)

toNatural :: Integer -> Natural
toNatural x
  | x < 0 = error "Can't create negative naturals!"
  | otherwise = MakeNatural x

fromNatural :: Natural -> Integer
fromNatural (MakeNatural i) = i
