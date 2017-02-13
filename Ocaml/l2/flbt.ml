
(*Zad 3*)

type 'a flbt = (nat -> 'a)

let rec char_flbt : char flbt = fun pos ->
	if pos = i2n 1 || pos = i2n 2 then 'a'
	else if pos = i2n 3 then 'b'
	else char_flbt (ndiv2 pos)

let pos_root = i2n 1

let rec find_le_pow = fun acc pos -> 
	if nless_eq acc pos then find_le_pow (nmul2 acc) pos
	else ndiv2 acc

let pos_left_child = fun pos ->
	nadd pos (find_le_pow (i2n 1) pos)
	
let pos_right_child = fun pos ->
	nadd pos (nmul2 (find_le_pow (i2n 1) pos))
	
let rec is_left_pos = fun pos ->
	if pos = i2n 1 then failwith "Parent node"
	else if pos = i2n 2 then true
	else if pos = i2n 3 then false
	else is_left_pos (ndiv2 pos)
	
let pos_parent = fun pos ->
	if pos = i2n 1 then failwith "No parent"
	else if is_left_pos pos then nsub pos (ndiv2 (find_le_pow (i2n 1) pos))
	else nsub pos (find_le_pow (i2n 1) pos)

let has_val = fun (tree : 'a flbt) pos ->
	let pos_val = 
		try 
			Some (tree pos)
		with exc ->
			None
	in pos_val != None

let is_empty = fun (tree : 'a flbt) ->
	has_val tree pos_root = false
	
let rec has_path_val = fun (tree : 'a flbt) pos ->
	if pos = pos_root then has_val tree pos
	else has_val tree pos && has_path_val tree (pos_parent pos)
	
let get = fun (tree : 'a flbt) pos ->
	if has_path_val tree pos then tree pos
	else failwith "Undefined node"

let empty : 'a flbt = fun _ -> 
	failwith "Undefined node"
	
let join : 'a flbt -> 'a flbt -> 'a -> 'a flbt = 
fun tree1 tree2 elem -> 
	fun pos ->
		if pos = i2n 1 then elem
		else if nmod2 pos = 0 then tree1 (ndiv2 pos)
		else tree2 (ndiv2 pos)
				
let left_subtree : 'a flbt -> 'a flbt = fun tree ->
	fun pos -> 
		tree (nmul2 pos)
		
let right_subtree : 'a flbt -> 'a flbt = fun tree ->
	fun pos -> 
		tree (nadd (nmul2 pos) (i2n 1))
		
let rec node_depth = fun (tree : 'a flbt) pos ->
	if has_val tree pos = false then i2n 0
	else 
		let l_depth = node_depth tree (pos_left_child pos)
		and r_depth = node_depth tree (pos_right_child pos)
		in nadd (max l_depth r_depth) (i2n 1)
		 
let depth = fun (tree : 'a flbt) ->
	if has_val tree pos_root = false then i2n 0 
	else node_depth tree pos_root
		
let rec log_tree = fun (tree : 'a flbt) pos ->
	if has_val tree pos = false then empty
	else
		let node = tree pos
		and l_child = log_tree tree (pos_left_child pos)
		and r_child = log_tree tree (pos_right_child pos)
		in join l_child r_child node

let memorize : 'a flbt -> 'a flbt = fun tree ->
	let mem_tree = log_tree tree pos_root
	in fun pos ->
		mem_tree pos
	
let rec get_path = fun pos ->
	if pos = i2n 1 then []
	else if nmod2 pos = 0 then 0 :: get_path (ndiv2 pos)
	else 1 :: get_path (ndiv2 pos)
	
let get_next_pos = fun pos dir (tree : 'a flbt) ->
	let sugg_pos = 
		if dir = 0 then pos_left_child pos
		else pos_right_child pos
	in 
		if has_val tree sugg_pos then sugg_pos
		else pos_root
	
let rec get_looped_pos = fun pos path (tree : 'a flbt) ->
	match path with 
		| [] -> pos
		| head :: tail -> 
			let next_pos = get_next_pos pos head tree 
			in get_looped_pos next_pos tail tree
	
let loop : 'a flbt -> 'a flbt = fun tree ->
	fun pos ->
		let pos_path = get_path pos 
		in tree (get_looped_pos pos_root pos_path tree)		
		
(*Zad 4*)

let rec sum_nt (tree : int flbt) =
	if has_val tree pos_root = false then 0
	else 
		let left_sum = sum_nt (left_subtree tree)
		and right_sum = sum_nt (right_subtree tree)
		in left_sum + right_sum + tree pos_root
	
		
let sum_t (tree : int flbt) =
	let rec aux (tree_list : int flbt list) acc = 
		match tree_list with
		 | [] -> acc
		 | h::t -> 
			if has_val h pos_root = false then 
				aux t acc
			else		 
				let t_val = h pos_root
				and l_node = left_subtree h
				and r_node = right_subtree h			
				in aux (l_node::r_node::t) (acc + t_val)		 		
	in aux [tree] 0
			
		
(*Zad 5*)

let rec only_right p =
	p = pos_root || nmod2 p = 1 && only_right (ndiv2 p)
	
let rec nless_eq_bits (num : nat) (count : int) : bool = 
	if count < 0 then false
	else 
		match num with
		 | _::num' -> nless_eq_bits num' (count - 1)	 
		 | []      -> true
	
let t_right1 (max_v : int) : int flbt =
	fun pos -> 
		if nless_eq_bits pos max_v && only_right pos then 1
		else failwith "Error"
		

		
		
		
		
