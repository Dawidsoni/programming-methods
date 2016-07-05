
aux :: (Ord a) => [a] -> a -> [a]

aux [] x = [x]

aux (x:xs) y
	| x < y		=	(y:x:xs)
	| otherwise	=	(x:xs)

ssm :: Ord a => [a] -> [a]

ssm xs = reverse (foldl aux [] xs)


