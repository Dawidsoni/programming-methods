import Control.Monad

tails1 :: [a] -> [[a]]

tails1 [] = [[]]

tails1 xs@(x:ys) = (xs : tails1 ys)


tails2 :: [a] -> [[a]]

tails2 [] = [[]]

tails2 xs@(x:ys) = xs:[zs | zs <- tails2 ys]



tails3 :: [a] -> [[a]]

tails3 [] = [[]]

tails3 xs@(x:ys) = return xs `mplus` do 
	zs <- tails3 ys
	return zs
	
	
	
	
	

