module Collatz where

import Control.Parallel
import Data.Time.Clock (diffUTCTime, getCurrentTime)
import System.Environment (getArgs)

-- The next value in a Collatz sequence
collatz n
    | even n    = n `div` 2     -- Using (/) requires Fractional type
    | otherwise = 3 * n + 1

collatzSeq 1 = [1]
collatzSeq n = n:(collatzSeq next)
    where next = collatz n

-- Faster way to find length of a Collatz sequence
collatzLen l 1 = l
collatzLen l n = collatzLen (l+1) (collatz n)

-- Given a Collatz sequence, does the Collatz conjecture hold?
collatzHolds cs = ((==1) . last) cs

-- Exhaustively prove that the Collatz sequence
-- starting with any number between 1 and `n` ends with 1
exCollatz n = all ((==1) . last) [ collatzSeq x | x <- [1..n] ]
-- With foldl (slower)
-- exCollatz n = foldl (&&) True [ (last (collatzSeq x)) == 1 | x <- [1..n] ]

-- Exhaustively prove the Collatz conjecture up to n in parallel
parExCollatz n = c1 `par` (pseq c2 (c1 && c2))
                    where c1 = exhaustCollatz [1..(div n 2)]
                          c2 = exhaustCollatz [(div n 2)..n]

exhaustCollatz range = all ((==1) . last) [ collatzSeq x | x <- range ]

-- Exhaustively prove the Collatz conjecture for a range of values in parallel
-- It's assumed the values are in sorted order along the lines of [1..n]
parExhaustCollatz ns
    | length ns < 1000  = exhaustCollatz ns
    | otherwise         = c1 `par` (pseq c2 (c1 && c2))
                            where c1   = parExhaustCollatz [1..half]
                                  c2   = parExhaustCollatz [half..half*2]
                                  half = (length ns) `div` 2

