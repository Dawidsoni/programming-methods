
newtype StateComput s a = SC (s -> (a, s))

instance Monad (StateComput s) where
	return result = SC (\state -> (result, state))

	(SC sc) >>= f = SC (\state -> 
		let
			(result, state') = sc state
			(SC sc') = f result
		in sc' state')
	
	
	
