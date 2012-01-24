-- Example from "Learn You a Haskell"
--
-- Pierre likes to tightrope walk with a pole
-- but birds land on both ends. If there are
-- three more birds on one end of his pole
-- than the other, Pierre falls!
--
-- Oh yeah, and there's a banana on the rope.

type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | diff < 4  = Just (left + n, right)
    | otherwise = Nothing
    where diff = abs ((left + n) - right)

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | diff < 4  = Just (left, right + n)
    | otherwise = Nothing
    where diff = abs (left - (right + n))

banana :: Pole -> Maybe Pole
banana _ = Nothing

routine :: Maybe Pole
routine = do
    start <- return (0,0)
    first <- landLeft 2 start
    second <- landRight 2 first
    landLeft 1 second
x -: f = f x
