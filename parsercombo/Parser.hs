{-# LANGUAGE LambdaCase #-}

module Parser where

import Control.Applicative
import Data.List (nub)

data Error e
  = EndOfInput
  | UnExpected e
  | CustomError String
  | Empty
  deriving (Eq, Show)

newtype Parser e v =
  Parser
    { runParser :: String -> Either [Error e] (v, String)
    }

instance Functor (Parser t1) where
  fmap f (Parser t2) =
    Parser $ \input -> do
      (output, rest) <- t2 input
      return (f output, rest)

instance Applicative (Parser t1) where
  pure a = Parser (\input -> Right (a, input))
  (Parser p1) <*> (Parser p2) =
    Parser $ \input -> do
      (f, rest) <- p1 input
      (output, rest') <- p2 rest
      return (f output, rest')

satisfy :: (Char -> Bool) -> Parser Char Char
satisfy predicate =
  Parser $ \case
    [] -> Left [EndOfInput]
    (hd:rest)
      | predicate hd -> Right (hd, rest)
      | otherwise -> Left [UnExpected hd]

char :: Char -> Parser Char Char
char i = satisfy (== i)
