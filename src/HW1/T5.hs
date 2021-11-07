module HW1.T5 where

import Data.List.NonEmpty (NonEmpty(..))

-- 1. Implement the following function:
splitOn :: Eq a => a -> [a] -> NonEmpty [a]
splitOn _ [] = [] :| []
splitOn sep (x : xs) | sep == x  = [] :| y : ys
                     | otherwise = (x : y) :| ys
                     where (y :| ys) = splitOn sep xs

-- | Conceptually, it splits a list into sublists by a separator:
-- ghci> splitOn '/' "path/to/file"
-- ["path", "to", "file"]
-- ghci> splitOn '/' "path/with/trailing/slash/"
-- ["path", "with", "trailing", "slash", ""]

-- | Due to the use of NonEmpty to enforce that there is at least one sublist in the output,
-- the actual GHCi result will look slightly differently:
-- ghci> splitOn '/' "path/to/file"
-- "path" :| ["to","file"]
-- Do not let that confuse you. The first element is not in any way special.

-- 2. Implement the following function:
joinWith :: a -> NonEmpty [a] -> [a]
joinWith _ (x :| [])   = x
joinWith sep (x :| xs) = x ++ [sep] ++ joinWith sep (helper xs)
    where helper :: [a] -> NonEmpty a
          helper (y : ys) = y :| ys

-- | It must be the inverse of splitOn, so that:
-- (joinWith sep . splitOn sep) ≡ id
-- Example usage:
-- ghci> "import " ++ joinWith '.' ("Data" :| "List" : "NonEmpty" : [])
-- "import Data.List.NonEmpty"
