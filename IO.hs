-- IO with no return
hello :: String -> IO ()
hello str = putStrLn ("Hello " ++ str)

-- IO with return
{-|
 - If the resulting function is not IO, must use the 'return' on it
 - 'return' wraps the value into IO monad
-}
nextNum :: Int -> IO Int
nextNum i = do
  putStrLn ("successor of " ++ show i ++ ":")
  return $ succ i

main = do
  putStrLn "Enter your name:"
  input <- getLine
  hello input
  [name, num] <- seqIO
  hello $ name ++ ".."
  putStrLn (num ++ " is your lucky number?")

seqIO = do
  putStrLn "Again!"
  putStrLn "Enter your name and a number"
  sequence [getLine, getLine]
