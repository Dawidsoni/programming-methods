include Lazy
include String

(*Zad 1*)

type 'a llist =
    | LNil
    | Elem of 'a * 'a llist Lazy.t
    
type 'a ltree = 
	| Empty 
	| Node of 'a * 'a ltree llist Lazy.t

(*Zad 2*)
			
(* dla nieskonczonych sciezek BFS jest lepszy, a dla 
   wierzcholkow z nieskonczona liczba dzieci DFS 
   jest lepszy, wiec napisalem 2 wersje 
*)
      
let tree2llist_bfs tree = 
	let rec aux queue =
		match queue with 
		 | [] -> LNil
		 | (lazy LNil)::xs -> aux xs
		 | (lazy (Elem (tree, tail)))::xs ->
			match tree with
			 | Empty -> aux (tail::xs)
			 | Node (el, chl_lst) -> 
				Elem (el, lazy (aux (tail::xs @ [chl_lst])))
	in 
		match tree with
		 | Empty -> LNil
		 | Node (node, chl_lst) -> 
			Elem (node, lazy (aux [chl_lst]))
		 		

let tree2llist_dfs tree = 
	let rec aux stack =
		match stack with 
		 | [] -> LNil
		 | (lazy LNil)::xs -> aux xs
		 | (lazy (Elem (tree, tail)))::xs ->
			match tree with
			 | Empty -> aux (tail::xs)
			 | Node (el, chl_lst) -> 
				Elem (el, lazy (aux (chl_lst::tail::xs)))
	in 
		match tree with
		 | Empty -> LNil
		 | Node (node, chl_lst) -> 
			Elem (node, lazy (aux [chl_lst]))
					 		 
(*Zad 3*)

let div_string text = 
	let div3 p1 p2 = 
		let t1 = sub text 0 p1 
		and t2 = sub text p1 (p2 - p1)
		and t3 = sub text p2 (length text - p2)
		in (t1, t2, t3)
	in
	let rec aux p1 p2 = 
		if p1 > length text then []
		else if p2 > length text then aux (p1 + 1) (p1  + 1)
		else div3 p1 p2 :: aux p1 (p2 + 1)  	
	in 
		aux 0 0

let rec lazy_chl_lst chl_func all_plst vtx = 
	let rec aux dlst plst = 	
		match (dlst, plst) with 
		 | ([], _) -> LNil 
		 | (_::dxs, []) -> aux dxs all_plst
		 | ((u', wx, u'')::_, (w, v)::pxs) when wx = w ->
			let chl_lab = u' ^ v ^ u''	
			in 
			let chl = chl_func all_plst chl_lab
			and tail = lazy (aux dlst pxs)	
			in Elem (chl, tail)
		 | (_, _::pxs) -> aux dlst pxs			
	in 
		aux (div_string vtx) all_plst
		
let rec rewrite_tree plist vtx =
	let lazy_tree chl_lst = 
		Node (vtx, chl_lst)		
	in 
	let chl_lst = 		
		lazy (lazy_chl_lst rewrite_tree plist vtx) 
	in
		lazy_tree chl_lst	
		
(*Zad 4*)

let has_path plist src dst = 
	let rec	aux lst =  
			match lst with 
			 | LNil -> false
			 | Elem (node, _) when node = dst ->
				true
			 | Elem (_, lazy tail) -> 
				aux tail
	and tree = 
		rewrite_tree plist src
	in 	
		aux (tree2llist_bfs tree)

