-- Functionally equivalent to csv1.hs
import Text.ParserCombinators.Parsec

csvFile = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n")
eol = char '\n'

