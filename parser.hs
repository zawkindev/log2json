import System.IO

main :: IO()
main = do
  contents <- readFile "test.log" 
  print contents
