import System.IO

main = do
     state <- readFile "/proc/acpi/battery/BAT0/state"
     print . lines $ state
     info <- readFile "/proc/acpi/battery/BAT0/info"
     print . lines $ info
    
     




