

lengthr = foldr (\ _ x -> x + 1) 0 

lengthl = foldl (\ x _ -> x + 1) 0

(+++) = flip $ foldr (:)

concatr = foldr (++) []

reversel = foldl (flip (:)) []

suml = foldl (+) 0

