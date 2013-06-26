import Control.Monad
import System.Random

getLines = liftM lines . readFile 

--title = 

main = do
    verbs <- getLines "verbs.txt"
    nouns <- getLines "nouns.txt"
    
    let lengthOfVerbs = ((length verbs) - 1)
    let lengthOfNouns = ((length nouns) - 1)

  --  g <- newStdGen
   -- random

    --verbCount <- (verbs !! ((length verbs)-1))
    --print verbCount
    -- map  M_ putStrLn length verbs
