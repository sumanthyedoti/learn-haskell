elems = [2,2 * 2 .. 20]

data Option a
  = Some a
  | None
  deriving (Show)

elemAt xs i
  | null xs = None
  | i < length xs = Some $ xs !! i
  | otherwise = None

class BoxMap b where
  bmap :: (x -> y) -> b x -> b y

instance BoxMap Option where
  bmap f (Some x) = Some $ f x
  bmap f None = None
