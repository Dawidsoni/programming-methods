
scanrr :: (a -> b -> b) -> b -> [a] -> [b]

scanrr _ acc [] = [acc]

scanrr f acc (x:xs) = (x `f` y):y:ys  where (y:ys) = scanr f acc xs
