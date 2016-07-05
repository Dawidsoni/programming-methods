import Data.List
import Control.Monad

distinct :: [Int] -> [Int] -> [Int]

distinct xs ys = nub list where
	zipped = zip xs ys
	list = map (\(a, b) -> (a - b)) zipped

isDistinct xs n = length l1 == n && length l2 == n where
	l1 = distinct xs [0..n - 1]
	l2 = distinct xs $ reverse [0..n - 1]

generate n = do
		xs <- permutations [0..(n-1)]
		guard $ isDistinct xs n
		return xs
 
