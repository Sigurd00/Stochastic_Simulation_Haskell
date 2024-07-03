import Data.Foldable (minimumBy)
-- Define data structures for reactions and state
data Reaction = Reaction {
    inputs :: [(String, Int)],
    products :: [(String, Int)],
    rate :: Double
} deriving (Show)

type State = [(String, Int)]
-- TODO 2 Define compute delay function
-- TODO 3 Define execute reaction function
-- TODO 4 Define simulation loop


main :: IO ()
main = do
    let reactions = [
            Reaction [("A", 1), ("C", 1)] [("B", 1), ("C", 1)] 0.001
            -- Add other reactions here
            ]
        initialState = [("A", 100), ("B", 0), ("C", 1)]
        endTime = 1000
    
    let generator = simulate reactions endTime initialState
    
    print finalState
