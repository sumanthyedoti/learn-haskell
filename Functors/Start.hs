import Data.Char
import Data.List

{-|
 - Functor is any type either pure or impure which is mappable
 - Functor helps to apply pure functions to impure values
 - 'fmap' takes a function and applies the function to the values in Functor
 - without 'fmap' we need to unwrap 'Just'
-}
ex1 = fmap (+ 1) (Just 10)

ex1'2 = (+ 1) <$> (Just 10)

-- map on list of Maybe types
ex2 = map (fmap (* 2)) [Just 2, Just 4, Just 7, Just 9]

ex3 = fmap ("Hello " ++) getLine

-- Implement Functor to Maybe like type 'Option'
data Option a
  = Some a
  | None
  deriving (Show)

instance Functor Option where
  fmap f (Some a) = Some $ f a
  fmap f None = None

{-
- IO is an instance of Functor
- Instead of
      do line <- getLine
         let line' = reverse line
- can do
-}
functorIO = do
  line <- fmap reverse getLine
  putStrLn $ "You said " ++ line ++ " backwards!"

-- multiple transformations to data inside a functor
multiTransformations = do
  line <- fmap (intersperse '-' . reverse . map toUpper) getLine
  putStrLn line

main :: IO ()
main = undefined
