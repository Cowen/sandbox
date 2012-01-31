import Text.ParserCombinators.Parsec

-- CSV is 0 or more lines, each terminated by EOL
csvFile :: GenParser Char st [[String]]
csvFile = do
        result <- many line
        eof
        return result

-- Each line contains 1 or more cells
line :: GenParser Char st [String]
line = do
    result <- cells
    eol
    return result

-- Build list of cells. Try to parse first cell,
-- then figure out what ends the cell
cells :: GenParser Char st [String]
cells = do
    first <- cellContent
    next <- remainingCells
    return (first : next)

-- The cell ends with either comma or EOL.
remainingCells :: GenParser Char st [String]
remainingCells =
    (char ',' >> cells)     -- Found comma, more cells soon
    <|> (return [])         -- No more cells

-- Each cell contains 0+ characters
-- None of which are comma or EOL
cellContent :: GenParser Char st String
cellContent =
    many (noneOf ",\n")

-- EOL character is '\n'
eol :: GenParser Char st Char
eol =
    char '\n'

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "(unknown)" input
