
data Cyclist a = Elem (Cyclist a) a (Cyclist a)

fromList :: [a] -> Cyclist a

fromList (x:xs) = cur where 
	cur = Elem last x next 
	(last, next) = aux xs cur cur

aux [] prev first = (prev, first)
		  
aux (x:xs) prev first = (last, cur) where 
	cur = Elem prev x next
	(last, next) = aux xs cur first

forward :: Cyclist a -> Cyclist a

forward (Elem _ _ next) = next

backward :: Cyclist a -> Cyclist a

backward (Elem prev _ _) = prev

label :: Cyclist a -> a

label (Elem _ label _) = label


enumInts :: Cyclist Integer

enumInts = Elem prev 0 next where
	prev = negative (-1) enumInts 
	next = positive 1 enumInts
	
negative :: Integer -> Cyclist Integer -> Cyclist Integer	

negative num next = cur where
	cur = Elem prev num next 
	prev = negative (num - 1) cur
	
positive :: Integer -> Cyclist Integer -> Cyclist Integer

positive num prev = cur where
	cur = Elem prev num next
	next = positive (num + 1) cur
	

	
	






