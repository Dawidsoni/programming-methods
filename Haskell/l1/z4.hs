
rever, rev :: [a] -> [a]

rever [] = []

rever(x:xs) = rever(xs) ++ [x]

rev = aux [] where
	aux ys [] = ys
	aux ys (x:xs) = aux (x:ys) xs
	
	
