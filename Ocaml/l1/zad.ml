
(*Dawid Wegner*)

(*Zad 1*)

type 'a flbt = (int -> 'a)

(*wariant b)*)

(*Zad 2*)

let rec char_flbt : char flbt = fun pos ->
	if pos = 1 || pos = 2 then 'a'
	else if pos = 3 then 'b'
	else char_flbt (pos / 2)
	
(*Zad 3*)

let pos_root = 1

let rec find_le_pow = fun acc pos -> 
	if acc <= pos then find_le_pow (acc * 2) pos
	else (acc / 2)

let pos_left_child = fun pos ->
	pos + find_le_pow 1 pos
	
let pos_right_child = fun pos ->
	pos + (find_le_pow 1 pos) * 2
	
let rec is_left_pos = fun pos ->
	if pos = 1 then failwith "Parent node"
	else if pos = 2 then true
	else if pos = 3 then false
	else is_left_pos (pos / 2)
	
let pos_parent = fun pos ->
	if pos = 1 then failwith "No parent"
	else if is_left_pos pos then pos - (find_le_pow 1 pos) / 2
	else pos - (find_le_pow 1 pos)

(*Zad 4*)

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
	
(*Zad 5*)	

let empty : 'a flbt = fun _ -> 
	failwith "Undefined node"
	
let join : 'a flbt -> 'a flbt -> 'a -> 'a flbt = 
fun tree1 tree2 elem -> 
	fun pos ->
		if pos = 1 then elem
		else if pos mod 2 = 0 then tree1 (pos / 2)
		else tree2 (pos / 2)
				
let left_subtree : 'a flbt -> 'a flbt = fun tree ->
	fun pos -> 
		tree (pos * 2)
		
let right_subtree : 'a flbt -> 'a flbt = fun tree ->
	fun pos -> 
		tree (pos * 2 + 1)
		
(*Zad 6*)

let rec node_depth = fun (tree : 'a flbt) pos ->
	if has_val tree pos = false then 0
	else 
		let l_depth = node_depth tree (pos_left_child pos)
		and r_depth = node_depth tree (pos_right_child pos)
		in max l_depth r_depth + 1
		 
let depth = fun (tree : 'a flbt) ->
	if has_val tree pos_root = false then 0 
	else node_depth tree pos_root

(*Zad 7*)
		
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

(*Zad 8*)	
	
let rec get_path = fun pos ->
	if pos = 1 then []
	else if pos mod 2 = 0 then 0 :: get_path (pos / 2)
	else 1 :: get_path (pos / 2)
	
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
		
