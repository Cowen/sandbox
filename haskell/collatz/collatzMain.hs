module Main where

import Data.Time.Clock (diffUTCTime, getCurrentTime)
import System.Environment (getArgs)

import Collatz


main = do
    args <- getArgs
    let count | null args = 100000
              | otherwise = read (head args)
    start1 <- getCurrentTime
    let range = [1..count]
    let s = exhaustCollatz range
    putStrLn $ "Sequentially proven, the Collatz conjecture up to " ++ show count ++ " is " ++ show s ++ "."
    end1 <- getCurrentTime
    putStrLn $ show (end1 `diffUTCTime` start1) ++ " elapsed.\n"
    start2 <- getCurrentTime
    let p = parExhaustCollatz range
    putStrLn $ "Proven in parallel, the Collatz conjecture up to " ++ show count ++ " is " ++ show p ++ "."
    end2 <- getCurrentTime
    putStrLn $ show (end2 `diffUTCTime` start2) ++ " elapsed.\n"
