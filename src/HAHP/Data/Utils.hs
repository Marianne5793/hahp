module HAHP.Data.Utils where

import           Data.Map                      (Map)
import           GHC.Generics
import           Numeric.LinearAlgebra.HMatrix

import           HAHP.Data.Core

-- * Data retrieve functions

getTreeLeaves :: AHPTree   -- ^ Input tree
              -> [AHPTree] -- ^ List of the leaves
getTreeLeaves ahpTree =
    case ahpTree of
      AHPTree {} -> concatMap getTreeLeaves (children ahpTree)
      AHPLeaf {} -> [ahpTree]

-- TODO: implémenter
getIndicatorCurrentLevelCount :: AHPTree -> Int
getIndicatorCurrentLevelCount tree = length $ children tree

-- TODO: implémenter
getIndicatorRecursiveCount :: AHPTree -> Int
getIndicatorRecursiveCount tree = length $ children tree
