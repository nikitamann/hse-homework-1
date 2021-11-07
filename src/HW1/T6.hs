module HW1.T6 where

import Data.Monoid
import Data.Foldable

-- | 1. Using Foldable methods, implement the following function
mcat :: Monoid a => [Maybe a] -> a
mcat x = foldMap f x
    where f :: Monoid a => Maybe a -> a
          f input = case input of {Nothing -> mempty; Just v  -> v}

-- Example usage:
-- ghci> mcat [Just "mo", Nothing, Nothing, Just "no", Just "id"]
-- "monoid"
-- ghci> Data.Monoid.getSum $ mcat [Nothing, Just 2, Nothing, Just 40]
-- 42

-- | 2. Using Foldable methods, implement the following function:
epart :: (Monoid a, Monoid b) => [Either a b] -> (a, b)
epart x = foldl f (mempty, mempty) x
    where f :: (Monoid a, Monoid b) => (a, b) -> Either a b -> (a, b)
          f (a, b) input = case input of  {(Left v) -> (a <> v, b); (Right v)  -> (a, v <> b)}

-- Example usage:
-- ghci> epart [Left (Sum 3), Right [1,2,3], Left (Sum 5), Right [4,5]]
-- (Sum {getSum = 8},[1,2,3,4,5])
