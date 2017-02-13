import Data.List

-- zad1

newtype Graph a = Graph ([a], a -> [a])

-- zad2

short_path :: Eq a => Graph a -> a -> a -> Maybe [a]
short_path (Graph (vlst, efunc)) src dst =
	aux [(src, [src])] [src] where
		aux queue occ 
		 | queue == []	=	Nothing
		 | vtx == dst	=	Just (reverse path)
		 | otherwise	=	aux queue' occ' where 			
			(vtx, path) = head queue			
			t_queue = tail queue					
			ngh_list = efunc vtx \\ occ
			path_list = map (\x -> x:path) ngh_list		
			queue' = t_queue ++ zip ngh_list path_list
			occ' = ngh_list ++ occ

-- zad3

iter_ngh :: Eq a => [a] -> (a -> Maybe [a]) -> Maybe [a]
iter_ngh [] _ = Nothing
iter_ngh (x:xs) func
	| res /= Nothing	=	res
	| otherwise			=	next_iter where 
		res = func x
		next_iter = iter_ngh xs func
		
ham_cycle :: Eq a => Graph a -> Maybe [a]
ham_cycle (Graph ([], _)) = Nothing
ham_cycle (Graph (vlst@(src:_), efunc)) =
	aux src [src] where
		v_count = length vlst
		aux vtx acc
		 | has_path && has_src	=	Just (reverse acc)
		 | otherwise			=	find_next where
			has_path = (length acc == v_count)
			has_src = elem src $ efunc vtx
			ngh_list = efunc vtx \\ acc
			ngh_func x = aux x (x:acc)
			find_next = iter_ngh ngh_list ngh_func

-- zad4

edge_rev_lst :: Eq a => Graph a -> [(a, a)]
edge_rev_lst (Graph (vlst, efunc)) = 
	aux vlst where 
		aux [] = []
		aux (vtx:xs) = edg_lst ++ aux xs where
			ngh_list = efunc vtx
			vtx_list = repeat vtx
			edg_lst = zip ngh_list vtx_list
			
make_rev_lst :: Eq a => Graph a -> [(a, [a])]
make_rev_lst graph@(Graph (vlst, efunc)) = 	
	aux vlst where 		
		edg_lst = edge_rev_lst graph		
		aux [] = []
		aux (x:xs) = vtx_info : aux xs where
			fil_func (v1, v2) = (v1 == x) 
			fil_list = filter fil_func edg_lst
			vtx_info = (x, snd $ unzip fil_list) 

rev :: Eq a => Graph a -> Graph a
rev graph@(Graph (vlst, efunc)) = 
	(Graph (vlst, aux rev_lst)) where 		
		rev_lst = make_rev_lst graph		
		aux ((x, ngh_lst):xs) y
		 | x == y		=	ngh_lst
		 | otherwise	=	aux xs y		
		
-- zad5

data Tree a = Node { val :: a, chl :: [Tree a] }

find_root :: Eq a => Graph a -> [a]
find_root graph =
	fst $ unzip fil_list where
		fil_func (vtx, edg_lst) = (edg_lst == []) 
		rev_list = make_rev_lst graph
		fil_list = filter fil_func rev_list

is_tree :: Eq a => Graph a -> a -> Bool
is_tree (Graph (vlst, efunc)) root =
	aux root [root] where
		aux vtx acc
		 | chl_lst == []	=	True
		 | cyc_lst /= []	=	False
		 | otherwise		=	is_subtree where			
			chl_lst = efunc vtx	
			cyc_lst = intersect chl_lst acc				
			chl_func chl = aux chl (chl:acc)
			is_subtree = all chl_func chl_lst

tree_size :: Eq a => Graph a -> a -> Int
tree_size graph@(Graph (vlst, efunc)) root =
	1 + sum subtree where 
		chl_lst = efunc root		
		map_func chl = tree_size graph chl
		subtree = map map_func chl_lst

make_tree :: Eq a => Graph a -> a -> (Tree a)
make_tree graph@(Graph (_, efunc)) vtx = 
	(Node {val = vtx, chl = chl_tree}) where 
			chl_lst = efunc vtx
			map_func x = make_tree graph x 	 	
			chl_tree = map map_func chl_lst

tree_of :: Eq a => Graph a -> Maybe (Tree a)
tree_of (Graph ([], _)) = Nothing	
tree_of graph@(Graph (vlst, _))	
	| has_root && is_t && is_s	=	Just tree
	| otherwise					=	Nothing where
		r_list = find_root graph
		has_root = length r_list == 1
		root = head r_list
		is_t = is_tree graph root
		is_s = (tree_size graph root == length vlst)
		tree = make_tree graph root 
