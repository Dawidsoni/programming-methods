
class Monoid a where
	(***) :: a -> a -> a
	e :: a

infixl 6 ***
	
infixr 7 ^^^

(^^^) :: Monoid a => a -> Integer -> a

a ^^^ 0  = e

a ^^^ n
	| n < 0		=	undefined
	| odd n		=	a *** half *** half
	| otherwise	=	half *** half
	where half = a ^^^ (n `div` 2)
	
instance Monoid Integer where
	n *** m = (n * m) `mod` 9876543210
	e = 1


{- 123567890 ^^^ 1234567890 = 2375491870 -}

{- instance Monoid Integer where
	n *** m = n + m 
	e = 0
-}



	
	
