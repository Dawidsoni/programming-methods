import Control.Monad
import Data.List

sublist1 :: [a] -> [[a]]

sublist1 [] = [[]]

sublist1 (x:xs) = concatMap (\ys -> [x:ys, ys]) $ sublist1 xs



sublist2 :: [a] -> [[a]]

sublist2 [] = [[]]

sublist2 (x:xs) = [zs | ys <- sublist2 xs, zs <- [x:ys, ys]]



sublist3 :: [a] -> [[a]]

sublist3 [] = return []

sublist3 (x:xs) = do
	ys <- sublist3 xs
	zs <- [x:ys, ys]
	return zs
	
	
