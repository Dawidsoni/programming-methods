
loop :: a 

loop = loop 

ones :: [Integer]

ones = 1 : ones

{-

head $ 1 : loop
1

fst(1, loop)
1

length [loop, loop, loop]
3

length ones
infinite loop

sum ones
stack overflow

last ones 
infinite loop

last [1..] 
infinite loop

let f [] = 0; f (_:xs) = 2 + f xs in f ones
stack overflow

-}



