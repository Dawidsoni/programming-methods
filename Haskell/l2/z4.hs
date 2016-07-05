
merge :: Ord a => ([a], [a]) -> [a]

merge([], ys) = ys

merge(xs, []) = xs

merge(x:xs, y:ys)
	| x < y		=	(x : merge(xs, y:ys))
	| otherwise =	(y : merge(x:xs, ys))

msortn :: Ord a => [a] -> Int -> [a]

msortn xs 0 = []

msortn (x:xs) 1 = [x]

msortn xs n = merge ((msortn xs half), (msortn (drop half xs) (n - half))) where
	half = n `div` 2

msort :: Ord a => [a] -> [a]

msort xs = msortn xs $ length xs

