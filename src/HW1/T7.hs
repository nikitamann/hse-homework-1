module HW1.T7 where

data ListPlus a = a :+ ListPlus a | Last a
infixr 5 :+

-- 1. Define a lawful Semigroup instance for ListPlus:
instance Semigroup (ListPlus a) where
  (<>) = undefined

data Inclusive a b = This a | That b | Both a b
-- 2. Define a lawful Semigroup instance for Inclusive:
instance (Semigroup a, Semigroup b) => Semigroup (Inclusive a b) where
  (<>) = undefined
-- The instance must not discard any values:
-- This i  <>  This j  =  This (i <> j)   -- OK
-- This i  <>  This _  =  This i          -- This is not the Semigroup you're looking for.

newtype DotString = DS String
-- 3. Implement a Semigroup instance for DotString, such that the strings are concatenated with a dot:
-- ghci> DS "person" <> DS "address" <> DS "city"
-- DS "person.address.city"
instance Semigroup DotString where
  (<>) = undefined

-- 4. Implement a Monoid instance for it. Make sure that the laws hold:
--    mempty <> a  ≡  a
--    a <> mempty  ≡  a
instance Monoid DotString where
  mempty = undefined

newtype Fun a = F (a -> a)
-- 5. Implement lawful Semigroup and Monoid instances for it.
instance Semigroup (Fun a) where
  (<>) = undefined

instance Monoid (Fun a) where
  mempty = undefined
