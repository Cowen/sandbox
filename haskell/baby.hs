import Control.Parallel

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = (if x > 100 then x else x*2) + 1

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors a b = (fst a + fst b, snd a + snd b)

head' :: [a] -> a
head' [] = error "Can't call head on an empty list!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: "  ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is too long! The first two elements are: " ++ show x ++ " and " ++ show y

-- length' :: (Num b) => [a] -> b
-- length' [] = 0
-- length' (_:xs) = 1 + length' xs

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "FAT"
    | otherwise     = "HUUUGE"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

calcBmis :: (RealFloat a) => [(a,a)] -> [a]
calcBmis xs = [ bmi w h | (w, h) <- xs, let bmi w h = w * h ^ 2 ]

initials :: String -> String -> String
initials firstname lastname = [f] ++ "." ++ [l] ++ "."
    where (f:_, l:_) = (firstname, lastname)

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in sideArea + 2 * topArea

max' :: (Ord a) => [a] -> a
max' []     = error "Max of empty list"
max' [x]    = x
max' (x:xs) = max x (max' xs)

quicksort []        = []
quicksort (x:xs)    =
    let smaller = quicksort [a | a <- xs, a <= x]
        bigger  = quicksort [a | a <- xs, a > x]
    in smaller ++ [x] ++ bigger

onlyVowels :: String -> String
onlyVowels "" = ""
onlyVowels s  = [ c | c <- s, c `elem` vowels ]
    where vowels = "aeiou"

-- freq :: (Num b, Ord a) => [a] -> [b]
-- freq []     = []
-- freq [a]    = [1]
-- freq (a:as) = 
--     where sort []       = []
--           sort (x:xs)   =
--                 let smaller = sort [a | a <- xs, a <= x]
--                     bigger  = sort [a | a <- xs, a > x]
--                 in smaller ++ [x] ++ bigger

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n    = n:chain (n `div` 2)
    | odd n     = n:chain (n*3 + 1)

length' :: [a] -> Int
length' []       = 0
length' (x:xs)   = 1 + (length' xs)

palindrome :: [a] -> [a]
palindrome []       = []
palindrome (x:[])   = [x,x]
palindrome (x:xs)   = [x] ++ palindrome xs ++ [x]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome []     = True
isPalindrome [x]    = True
isPalindrome xs = xs == (reverse xs)

isFactor a b = a `mod` b == 0

factors a = filter (isFactor a) [2..(a `div` 2)]

coprime a b = (gcd a b) == 1

isPrime :: (Integral a) => a -> Bool
isPrime n | n < 6 = (n > 1) && (n /= 4)
isPrime n = all ((/=0).mod n) $ 2:3:5:[x + i | x <- [6,12..s], i <- [-1,1]]
            where s = floor $ sqrt $ fromIntegral n

-- Not recommended for serious use
primeFactors n
    | isPrime n = [1,n]
    | otherwise = 1:[ x | x <- (factors n), isPrime x ] 

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

-- Exhaustively prove that the Collatz sequence
-- starting with any number between 1 and `n` ends with 1
-- Fun fact: This one line can prove the Collatz conjecture
-- up to n == 100K in ~35s on a Macbook Pro
exhaustCollatz n = all ((==1) . last) [ collatzSeq x | x <- [1..n] ]
-- With foldl (slower)
-- exhaustCollatz n = foldl (&&) True [ (last (collatzSeq x)) == 1 | x <- [1..n] ]

-- Given a Collatz sequence, does the Collatz conjecture hold?
collatzHolds cs = all ((==1) . last) cs
