import Control.Monad
import System.Random

getLines = liftM lines . readFile 

main = do
    verbs <- getLines "verbs.txt"
    nouns <- getLines "nouns.txt"
    
--    verb <- length verbs

    lengthOfVerbs <- (length verbs) - 1
    print lengthOfVerbs
    --verbCount <- (verbs !! ((length verbs)-1))
    --print verbCount
    -- mapM_ putStrLn length verbs
