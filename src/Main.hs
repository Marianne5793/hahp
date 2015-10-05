module Main where

import           Algorithm
import           Algorithm.Consistency
import           Algorithm.Ranking
import           Data.Time
import           Reporting
import           SampleAHPConfig

main :: IO ()
main = do
    time <- getCurrentTime
    let title = "Test de la librairie HAHP"
        author = "JP P, Y D"
    putStrLn $ reportHeader title author time
    putStrLn ""
    putStrLn "# Valeurs de Random Index selon Alonso & Lamata 2006"
    putStrLn ""
    let valeursRI = map randomIndexCalculated [1..15]
    print valeursRI
    putStrLn ""
    let configs = [sampleAHPConfig, sampleAHPConfig2, sampleAHPConfig3]
    --mapM_ (putStrLn . showConfigurationSummary . initAHP) configs
    let (initSampleAHPConfig3, validationSampleAHPConfig3) = initAHP sampleAHPConfig3
        ranking = rankAlternatives sampleAlternatives3 initSampleAHPConfig3
    --putStrLn . showConfigurationSummary $ (initSampleAHPConfig3, validationSampleAHPConfig3)
	completeTreeConfig3 = computeTreeAlternativesPriorities sampleAlternatives3 initSampleAHPConfig3
    putStrLn . showConfigurationSummary $ (completeTreeConfig3, validationSampleAHPConfig3)
    print ranking
    putStrLn ""
    putStrLn $ showAlternatives sampleAlternatives3
