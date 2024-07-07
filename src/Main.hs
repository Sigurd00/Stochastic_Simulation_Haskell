module Main where

import System.Random (randomRIO, newStdGen)
import Data.List (minimumBy)
import Data.Ord (comparing)
import Data.Maybe (fromMaybe, isNothing)
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

lookupAmount :: String -> State -> Maybe Int
lookupAmount name reactants = lookup name reactants

computeDelay :: Reaction -> State -> Double
computeDelay reaction reactants = do
        let inputAmounts = map (\(name, _) -> lookupAmount name reactants) (inputs reaction)
        if elem (Just 0) inputAmounts || any isNothing inputAmounts
        then return (1 / 0)
        else do
            let inputProduct = product (map (fromMaybe 1) inputAmounts)
            gen <- newStdGen
            let lambda = rate reaction * fromIntegral inputProduct
            u <- randomRIO (0, 1) gen
            return (- log u / lambda)


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
