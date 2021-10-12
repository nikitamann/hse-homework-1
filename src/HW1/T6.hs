module HW1.T6 where

-- | 1. Using Foldable methods, implement the following function
mcat :: Monoid a => [Maybe a] -> a
mcat = undefined
-- Example usage:
-- ghci> mcat [Just "mo", Nothing, Nothing, Just "no", Just "id"]
-- "monoid"
-- ghci> Data.Monoid.getSum $ mcat [Nothing, Just 2, Nothing, Just 40]
-- 42

-- | 2. Using Foldable methods, implement the following function:
epart :: (Monoid a, Monoid b) => [Either a b] -> (a, b)
epart = undefined
-- Example usage:
-- ghci> epart [Left (Sum 3), Right [1,2,3], Left (Sum 5), Right [4,5]]
-- (Sum {getSum = 8},[1,2,3,4,5])
