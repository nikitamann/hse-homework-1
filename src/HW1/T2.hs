module HW1.T2 where

import GHC.Natural (Natural)

-- | N is a data type that defines natural numbers inductively
data Nat = Z | S Nat

-- | 1. Implement the following operations

nplus :: Nat -> Nat -> Nat        -- addition
nplus = undefined

nmult :: Nat -> Nat -> Nat       -- multiplication
nmult = undefined

nsub :: Nat -> Nat -> Maybe Nat   -- subtraction     (Nothing if result is negative)
nsub = undefined

ncmp :: Nat -> Nat -> Ordering  -- comparison      (Do not derive Ord)
ncmp = undefined

nFromNatural :: Natural -> Nat
nFromNatural = undefined

nToNum :: Num a => Nat -> a
nToNum = undefined

-- | 2*. Implement the following operations
-- (Advanced) Implement the following operations:

nEven, nOdd :: Nat -> Bool    -- parity checking
nEven = undefined
nOdd = undefined

ndiv :: Nat -> Nat -> Nat         -- integer division
ndiv = undefined

nmod :: Nat -> Nat -> Nat         -- modulo operation
nmod = undefined
