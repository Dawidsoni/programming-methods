
fib :: Integer -> Integer

fib n = fibAcc n (1, 0)
	where fibAcc n (a, b)
		| n == 1	=	a
		| otherwise =   fibAcc (n - 1) (a + b, a)
		
		

