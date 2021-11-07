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
tsize Leaf                               = 0
tsize (Branch size l_tree h_elem r_tree) = size

-- | Depth of the tree.
tdepth :: Tree a -> Int
tdepth Leaf                               = 0
tdepth (Branch size l_tree h_elem r_tree) = 1 + max (tdepth l_tree) (tdepth r_tree)

-- | Check if the element is in the tree, O(log n)
tmember :: Ord a => a -> Tree a -> Bool
tmember _ Leaf = False
tmember element (Branch size l_tree h_elem r_tree) | element == h_elem = True
                                                   | element < h_elem  = tmember element l_tree
                                                   | element > h_elem  = tmember element r_tree

-- | Insert an element into the tree, O(log n)
tinsert :: Ord a => a -> Tree a -> Tree a
tinsert element Leaf = Branch 1 Leaf element Leaf
tinsert element (Branch size l_tree h_elem r_tree) | element == h_elem = Branch size l_tree h_elem r_tree
                                                   | element < h_elem  = Branch (size + 1) (tinsert element l_tree) h_elem r_tree
                                                   | element > h_elem  = Branch (size + 1) l_tree h_elem (tinsert element r_tree)

-- | Build a tree from a list, O(n log n)
tFromList :: Ord a => [a] -> Tree a
tFromList []       = Leaf
tFromList (x : xs) = tinsert x (tFromList xs)

-- | Tip 1: in order to maintain the CachedSize invariant, define a helper function:
mkBranch :: Tree a -> a -> Tree a -> Tree a
mkBranch = undefined
-- | Tip 2: the Balanced invariant is the hardest to maintain, so implement it last. Search for “tree rotation”.
