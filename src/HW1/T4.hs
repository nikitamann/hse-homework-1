module HW1.T4 where

import HW1.T3 (Tree(..))

-- | Using the Tree data type from HW1.T3, define the following function:
tfoldr :: (a -> b -> b) -> b -> Tree a -> b
tfoldr _ ini Leaf = ini
tfoldr f ini (Branch size l_tree h_elem r_tree) = tfoldr f fold_internal l_tree
    where fold_internal = f h_elem fold_ini_r_tree
          fold_ini_r_tree = tfoldr f ini r_tree

instance Foldable Tree where
  foldr = tfoldr

-- | It must collect the elements in order:
treeToList :: Tree a -> [a]    -- output list is sorted
treeToList = foldr (:) []

-- | This follows from the Sorted invariant.

-- | You are encouraged to define tfoldr in an efficient manner,
-- doing only a single pass over the tree and without constructing intermediate lists.
