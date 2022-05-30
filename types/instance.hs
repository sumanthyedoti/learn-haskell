data PetPerson =
  PetPerson
    { name :: String
    , pets :: Int
    }
  deriving (Eq)

instance Ord PetPerson where
  p1 <= p2 = pets p1 <= pets p2

p1 = PetPerson "Jhon" 2

p2 = PetPerson "Wick" 1
