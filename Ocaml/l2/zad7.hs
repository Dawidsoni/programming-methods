
type Cross = Int -> Char -> Int
type State = ([Char], Int)
type Aut = ([Char], Int, Cross, Int -> Bool)

make_states :: Char -> Cross -> [State] -> [State]
make_states _ _ [] = []
make_states symb cross_func ((old_word, old_state):xs) = 
	(word, state) : make_states symb cross_func xs where
		word = old_word ++ [symb]		
		state = cross_func state symb 

make_layer :: [Char] -> Cross -> [State] -> [[State]]
make_layer [] _ _ = []
make_layer (x:xs) cross_func state_list = 
	states : make_layer xs cross_func state_list where
	states = make_states x cross_func state_list
	
concat_layer :: [Char] -> Cross -> [State] -> [State]
concat_layer alph cross_func state_list = 
	concat $ make_layer alph cross_func state_list
	
aut_words :: Aut -> [([Char], Bool)]
aut_words (alph, init_num, cross_func, acc_func) = 
	aux [init_state] $ layer_func [init_state] where 
		init_state = ("", init_num)
		layer_func = concat_layer alph cross_func
		aux [] layer = aux layer $ layer_func layer
		aux (x:xs) n_layer = elem : (aux xs n_layer) where
			(word, state) = x
			elem = (word, acc_func state)
		
accepted_words :: Aut -> [String]
accepted_words aut = 
	[x | (x, acc) <- xs, acc == True] where
		xs = aut_words aut

