module HW1.T1 where

import GHC.Natural (Natural)
-- | 1. Define the following data type:
-- | data Day = Monday | Tuesday | ... | Sunday
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Show, Eq)

-- | 2. Implement the following functions:

-- | Returns the day that follows the day of the week given as input.
nextDay :: Day -> Day
nextDay Monday = Tuesday
nextDay Tuesday = Wednesday
nextDay Wednesday = Thursday
nextDay Thursday = Friday
nextDay Friday = Saturday
nextDay Saturday = Sunday
nextDay Sunday = Monday

-- | Returns the day of the week after a given number of days has passed.
afterDays :: Natural -> Day -> Day
afterDays 0 day = day
afterDays passed day = afterDays (passed - 1) (nextDay day)

-- | Checks if the day is on the weekend.
isWeekend :: Day -> Bool
isWeekend Saturday = True
isWeekend Sunday = True
isWeekend _ = False

-- | Computes the number of days until the next Friday.
daysToParty :: Day -> Natural
daysToParty Friday = 0
daysToParty day = daysToParty (nextDay day) + 1
