
newtype Random a = Random (Int -> (a, Int))

instance Monad Random where
	return result = Random (\state -> (result, state))
	
	(Random rand) >>= f = Random (\state ->
		let 
			(result, state') = rand state
			(Random rand') = f result
		in rand' state')

init :: Int -> Random () 
init val = Random (\_ -> ((), val))

random :: Random Int

random = Random (\state -> let state' = state * 3 + 2 in (state', state'))


