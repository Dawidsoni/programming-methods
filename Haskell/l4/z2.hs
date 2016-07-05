import Control.Monad
import Data.List

perms1 :: Eq a => [a] -> [[a]]

perms1 [] = [[]]

perms1 xs = concatMap (\x ->  map(\y -> x:y) (perms1 (delete x xs))) xs


perms2 :: Eq a => [a] -> [[a]]

perms2 [] = [[]]

perms2 xs = [y:ys | y <- xs, ys <- perms2 $ delete y xs]



perms3 :: Eq a => [a] -> [[a]]

perms3 [] = return []

perms3 xs = do
	y <- xs
	ys <- perms3 $ delete y xs 
	return (y:ys)
	
	
