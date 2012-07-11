import System.IO
import Text.Regex.Posix

getNumber :: String -> Double
getNumber str = read (str =~ "[0-9]+" :: String) :: Double

getCapacitance :: String -> String -> Double
getCapacitance ptn lns = getNumber . head . filter (=~ ptn) $ lines lns

main = do
  state <- readFile "/proc/acpi/battery/BAT0/state"
  info <- readFile "/proc/acpi/battery/BAT0/info"
  let current = getCapacitance "remaining capacity:" state
  let full = getCapacitance "design capacity:" info 
  print $ show (floor $ current / full * 100) ++ "%"

  
     




