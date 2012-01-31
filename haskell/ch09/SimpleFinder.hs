import RecursiveContents (getRecursiveContents)

-- Find a filename matching the predicate p
simpleFind :: (FilePath -> Bool) -> FilePath -> IO [FilePath]
simpleFind p path = do
    names <- getRecursiveContents path
    return (filter p names)
