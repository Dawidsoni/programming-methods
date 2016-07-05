import Control.Monad
import Data.List

unfoldInsert (xs, num, elem) 
 | len < num	=	Nothing
 | otherwise	=	Just(take num xs ++ [elem] ++ drop num xs, (xs, num + 1, elem)) 
 where len = length xs

insertElem elem xs = unfoldr unfoldInsert (xs, 0, elem)


permi1 :: [a] -> [[a]]

permi1 [] = [[]]

permi1 (x:xs) = concatMap (insertElem x) (permi1 xs)



permi2 :: [a] -> [[a]]

permi2 [] = [[]]

permi2 (x:xs) = [elem | ys <- permi2 xs, elem <- insertElem x ys]



permi3 :: [a] -> [[a]]

permi3 [] = return []

permi3 (x:xs) = do
	ys <- permi3 xs
	zs <- insertElem x ys
	return zs
	
	
	


