module HW1.T1 where

import GHC.Natural (Natural)
-- | 1. Define the following data type:
-- | data Day = Monday | Tuesday | ... | Sunday
data Day = Monday

-- | 2. Implement the following functions:

-- | Returns the day that follows the day of the week given as input.
nextDay :: Day -> Day
nextDay = undefined

-- | Returns the day of the week after a given number of days has passed.
afterDays :: Natural -> Day -> Day
afterDays = undefined

-- | Checks if the day is on the weekend.
isWeekend :: Day -> Bool
isWeekend = undefined

-- | Computes the number of days until the next Friday.
daysToParty :: Day -> Natural
daysToParty = undefined
