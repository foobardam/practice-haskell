import System.IO
import Text.Regex.Posix

getNumber :: String -> Double
getNumber str = read (str =~ "[0-9]+" :: String) :: Double

getCapacitance1 :: String -> Double
getCapacitance1 = getNumber . head . filter (=~ "remaining capacity:") . lines 

getCapacitance2 :: String -> Double
getCapacitance2 = getNumber . head . filter (=~ "design capacity:") . lines




main = do
  state <- readFile "/proc/acpi/battery/BAT0/state"
  print $ getCapacitance1 state 
  info <- readFile "/proc/acpi/battery/BAT0/info"
  print $ getCapacitance2 info 




  
     




