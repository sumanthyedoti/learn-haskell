data Pokemon =
  Pokemon
    { pokedexId :: Int
    , name :: String
    , pokemonType :: [String]
    , abilities :: [String]
    }
  deriving (Show)

instance Eq Pokemon where
  pokemon1 == pokemon2 = pokedexId pokemon1 == pokedexId pokemon2

instance Ord Pokemon where
  pokemon1 <= pokemon2 = pokedexId pokemon1 <= pokedexId pokemon2

slowking =
  Pokemon 199 "Slowking" ["Water", "Psychic"] ["Oblivious", "Own Tempo"]

jigglypuff =
  Pokemon 39 "Jigglypuff" ["Normal", "Fairy"] ["Cute Charm", "Competitive"]

chansey = Pokemon 113 "Chansey" ["Normal"] ["Natural Cure", "Serene Grace"]

main :: IO ()
main = undefined
