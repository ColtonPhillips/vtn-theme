import Control.Monad
import System.Random
import System.Time
import Data.List

getLines = liftM lines . readFile

verbs :: IO [String]
verbs = getLines "verbs.txt"

nouns :: IO [String]
nouns = getLines "nouns.txt"

themes :: [String] -> [String] -> [String]
themes verbs nouns = do
    verb <- verbs
    noun <- nouns
    [verb ++ " the " ++ noun]

randomNumbers :: RandomGen g => g -> Int -> [Int]
randomNumbers _ 0 = []
randomNumbers gen n = let (newVal, newGen) = next gen in newVal : (randomNumbers newGen (n-1))

prioritize :: Ord a => [Int] -> [a] -> [a]
prioritize priorityLevels toPrioritize = (map snd) . sort $ zip priorityLevels toPrioritize

main = do
    (TOD _ timeSeed) <- getClockTime
    verbList <- verbs
    nounList <- nouns
    let seed = fromInteger timeSeed
        seedGen = mkStdGen seed
        priorities = randomNumbers seedGen ((length verbList) * (length nounList))
        combos = themes verbList nounList
        in mapM putStrLn $ prioritize priorities combos
