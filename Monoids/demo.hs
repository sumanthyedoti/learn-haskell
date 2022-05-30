newtype I =
  I Int
  deriving (Show)

instance Semigroup I where
  I a <> I b = I (a + b)

instance Monoid I where
  mempty = I 0
  I a `mappend` I b = I (a + b)
