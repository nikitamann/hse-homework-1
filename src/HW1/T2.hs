module HW1.T2 where

import GHC.Natural (Natural)

-- | N is a data type that defines natural numbers inductively
data Nat = Z | S Nat

-- | 1. Implement the following operations

nplus :: Nat -> Nat -> Nat        -- addition
nplus Z x     = x
nplus (S x) y = S (nplus x y)

nmult :: Nat -> Nat -> Nat       -- multiplication
nmult x Z     = Z
nmult x (S y) = nplus x (nmult x y)

nsub :: Nat -> Nat -> Maybe Nat   -- subtraction     (Nothing if result is negative)
nsub x Z         = Just x
nsub Z x         = Nothing
nsub (S x) (S y) = nsub x y

ncmp :: Nat -> Nat -> Ordering  -- comparison      (Do not derive Ord)
ncmp Z Z         = EQ
ncmp Z _         = LT
ncmp _ Z         = GT
ncmp (S x) (S y) = ncmp x y

nFromNatural :: Natural -> Nat
nFromNatural 0 = Z
nFromNatural x = S (nFromNatural (x-1))

nToNum :: Num a => Nat -> a
nToNum Z     = 0
nToNum (S x) = (1 + nToNum x)

-- | 2*. Implement the following operations
-- (Advanced) Implement the following operations:

nEven, nOdd :: Nat -> Bool    -- parity checking
nEven Z = True
nEven x | ncmp x (S Z) == GT = nEven (f (nsub x (S (S Z))))
        | otherwise          = False
        where f :: Maybe Nat -> Nat
              f (Just res) = res
nOdd x | nEven x == False = True
       | otherwise        = False

ndiv :: Nat -> Nat -> Nat         -- integer division
ndiv _ Z = errorWithoutStackTrace "Na nol ne delim!!!"
ndiv x y | ncmp x y == LT = Z
         | ncmp x y == GT = S (ndiv (f (nsub x y)) y)
         | otherwise      = S Z
         where f :: Maybe Nat -> Nat
               f (Just res) = res

nmod :: Nat -> Nat -> Nat         -- modulo operation
nmod _ Z = errorWithoutStackTrace "Na nol ne delim!!!"
nmod x y | ncmp x y == LT = x
         | ncmp x y == GT = nmod (f (nsub x y)) y
         | otherwise      = Z
         where f :: Maybe Nat -> Nat
               f (Just res) = res
