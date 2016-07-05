import Data.Char
import Data.List

unfoldInt :: Integer -> Maybe(Char, Integer)

unfoldInt n
	| n == 0 	=	Nothing
	| otherwise	=	Just((intToDigit . fromEnum) (n `mod` 10), n `div` 10)


integerToString :: Integer -> String

integerToString 0 = "0"

integerToString n = reverse (unfoldr unfoldInt n)

