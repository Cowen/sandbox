import System.IO
import Data.Char (toUpper)

main :: IO ()
main =  do
        -- inh <- openFile "test.txt" ReadMode
        -- outh <- openFile "output.txt" WriteMode
        -- inpStr <- hGetContents inh
        -- let result = (map toUpper inpStr)
        -- hPutStr outh result
        -- hClose inh
        -- hClose outh

        -- Easier this way
        inpStr <- readFile "input.txt"
        writeFile "output.txt" (map toUpper inpStr)

        -- More general this way, pipe in files from command line
        -- interact (map toUpper)
