data Iterate seed   = Done      { unwrap :: seed }
                    | Skip      { unwrap :: seed }
                    | Continue  { unwrap :: seed }
                      deriving (Show)

type Iterator seed = seed -> Info -> Iterate seed

foldTree :: Iterator a -> a -> FilePath -> IO a

foldTree iter initSeed path = do
    endSeed <- fold initSeed path
    return (unwrap endSeed)
