import Control.Monad
import System.Random

getLines = liftM lines . readFile 

themes :: [String]
themes verbs nouns = do
    verb <- verbs
    nouns <- nouns
    [verb ++ " the " ++ noun]

randomNumbers :: RandomGen g => g -> Int -> [Int]
randomNumbers _ 0 = []
randomNumbers gen n = let (newVal, newGen) = next gen in newVal : (randomNumbers newGen (n-1))

prioritize :: Ord a => [Int] -> [a] -> [a]
prioritize priorityLevels toPrioritize = (map snd) . sort $ (zip priorityLevels toPrioritize)

main = do 
    verbs <- getLines "verbs.txt"
    nouns <- getLines "nouns.txt"
    let
        seed = 2
        seedGen = mkStdGen seed
        priorities = randomNumbers seedGen 100
        combos = themes verbs nouns
    in print $ prioritize priorities combos    
