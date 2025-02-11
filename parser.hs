import System.IO

extractInfo :: String -> String
extractInfo str = key ++ ":" ++ value
  where
    (key, value) = span (/= '=') str

findIndex :: Char -> String -> Int -> Int
findIndex c "" n = n
findIndex c str n =
  if c == head str
    then n
    else findIndex c (drop 1 str) (n + 1)

parse :: String -> String
parse "" = ""
parse (c : rest) = show c ++ '\n' : parse rest

main :: IO ()
main = do
  contents <- readFile "file.log"
  print (findIndex '=' contents 0)
