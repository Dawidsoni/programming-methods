
roots :: (Double, Double, Double) -> [Double]

roots(a, b, c) 
	| a == 0 && b == 0	=	[]
	| a == 0			=	[-c / b]
	| otherwise			=	
		case compare delta 0 of 
			LT -> []
			EQ -> [-b / (2 * a)]
			GT -> [(-b + sqrt(delta)) / 2 * a, (-b - sqrt(delta)) / 2 * a]
		where delta = b * b - 4 * a * c
			
	
	
data Roots = No | One Double | Two (Double, Double) deriving Show

roots2 :: (Double, Double, Double) -> Roots

roots2(a, b, c)
	| a == 0 && b == 0	=	No
	| a == 0			=	One(-c / b)
	| otherwise			=
		case compare delta 0 of
			LT -> No
			EQ -> One(-b / (2 * a))
			GT -> Two(((-b + sqrt(delta)) / 2 * a, (-b - sqrt(delta)) / 2 * a))
		where delta = b * b - 4 * a * c

roots3 :: Double -> Double -> Double -> [Double]		
		
roots3 a b c 
	| a == 0 && b == 0	=	[]
	| a == 0			=	[-c / b]
	| otherwise			=	
		case compare delta 0 of
			LT -> []
			EQ -> [-b / (2 * a)]
			GT -> [(-b + sqrt(delta)) / 2 * a, (-b - sqrt(delta)) / 2 * a]
		where delta = b * b - 4 * a * c
		
		
		
		
