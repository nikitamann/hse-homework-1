module HW1.T3 where

data Tree a = Leaf | Branch Int (Tree a) a (Tree a)

-- | Functions operating on this tree must maintain the following invariants:

-- 1. Sorted: The elements in the left subtree are less than the head element of a branch,
-- and the elements in the right subtree are greater.
-- 2. Unique: There are no duplicate elements in the tree (follows from Sorted).
-- 3. CachedSize: The Int field stores the size of the tree.
-- 4. (Advanced) Balanced: For any given Branch _ l _ r, the ratio between the size of l and the size of r never exceeds 3.

-- | Size of the tree, O(1).
tsize :: Tree a -> Int
tsize = undefined

-- | Depth of the tree.
tdepth :: Tree a -> Int
tdepth = undefined

-- | Check if the element is in the tree, O(log n)
tmember :: Ord a => a -> Tree a -> Bool
tmember = undefined

-- | Insert an element into the tree, O(log n)
tinsert :: Ord a => a -> Tree a -> Tree a
tinsert = undefined

-- | Build a tree from a list, O(n log n)
tFromList :: Ord a => [a] -> Tree a
tFromList = undefined

-- | Tip 1: in order to maintain the CachedSize invariant, define a helper function:
mkBranch :: Tree a -> a -> Tree a -> Tree a
mkBranch = undefined
-- | Tip 2: the Balanced invariant is the hardest to maintain, so implement it last. Search for “tree rotation”.
