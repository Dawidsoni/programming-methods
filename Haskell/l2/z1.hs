
nat2 :: [(Integer, Integer)]

nat2 = [(x, y - x) | y <- [0..], x <- [0..y]]


