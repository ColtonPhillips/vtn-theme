import Control.Monad (forM_, liftM)
import Data.Char (toUpper)
import System.Random (randomRs, mkStdGen)
import System.Time
 
readLines :: String -> IO [String]
readLines = liftM lines . readFile
 
title :: String -> String
title (x:xs) = (toUpper x):xs
 
main = do
    (TOD _ timeSeed) <- getClockTime
    verbList <- readLines "verbs.txt"
    nounList <- readLines "nouns.txt"
    let vNums = randomRs (0, length verbList) (mkStdGen $ fromIntegral timeSeed)
    let nNums = randomRs (0, length nounList) (mkStdGen $ fromIntegral (timeSeed + 1))
    forM_ (take 100 $ zip vNums nNums) (\(v, n) -> do
            let verb = title $ verbList !! v
            let noun = title $ nounList !! n
            putStrLn $ verb ++ " the " ++ noun
        )
