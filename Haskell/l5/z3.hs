
newtype SSC a = SSC (String -> (a, String))

instance Monad SSC where
	return result = SSC (\state -> (result, state))
	(SSC ssc) >>= f = SSC (\state ->
		let 
			(result, state') = ssc state 
			(SSC ssc') = f result 
		in ssc' state')
		
runSSC :: SSC a -> String -> a
runSSC (SSC ssc) state = fst $ ssc state

getc :: SSC Char
getc = SSC (\(x:xs) -> (x, xs))

ungetc :: Char -> SSC ()
ungetc x = SSC (\xs -> ((), x:xs))

isEOS :: SSC Bool
isEOS = SSC (\xs -> (xs == [], xs))
			


