{-# LANGUAGE FlexibleInstances #-}

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
	


data Mtx2x2 a = Mtx2x2 a a a a deriving Show

instance Monoid (Mtx2x2 Integer) where
	(Mtx2x2 a1 a2 a3 a4) *** (Mtx2x2 b1 b2 b3 b4) = 
		Mtx2x2 (a1 * b1 + a2 * b3) (a1 * b2 + a2 * b4) (a3 * b1 + a4 * b2) (a3 * b2 + a4 * b4)
	e = Mtx2x2 1 0 0 1
	
fib :: Integer -> Integer

fib n = result where 
	Mtx2x2 _ _ _ result = Mtx2x2 1 1 1 0 ^^^ n




	
	
	
