import System.IO
import Text.Parsec
import Text.Parsec.String


getCapacitance :: String -> String -> Double
getCapacitance ptn content = either (\_ -> -1.0) (\x -> x) $ parse (capacitanceP ptn) "" content

capacitanceP :: String -> Parser Double
capacitanceP str = do
  manyTill anyChar (try (string str))
  spaces
  n <- many1 digit
  return $ read n

main = do
  state <- readFile "/proc/acpi/battery/BAT0/state"
  let current = getCapacitance "remaining capacity:" state
  info <- readFile "/proc/acpi/battery/BAT0/info"
  let full = getCapacitance "design capacity:" info 
  putStr $ show (floor $ current / full * 100) ++ "%\n"


