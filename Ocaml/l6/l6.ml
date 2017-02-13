include List
include Array
include Queue
include Pervasives
include Random
include String
include Str

(*Zad 1*)

type 'a m_list = int -> 'a ref

(*
	Przebieg programu:

	let ex_list = 
		let x1 = ref 0
		and x2 = ref 2
		and x3 = ref 3 
		in ((fun x -> 
			if x = 0 then x1
			else if x = 1 then x2
			else if x = 2 then x3
			else failwith "Index out of range") : int m_list);;	

	ex_list 0 := 1;;
	ex_list 0;;
*)

(*Zad 2*)

type 'a graph = 'a list * ('a -> 'a list)
type raw_graph = int * (int -> int list)
type 'a opt_graph = raw_graph * (int -> 'a) * ('a -> int)

(*Zad 3*)

let rec get_numbered list num = 
	match list with 
	 | [] -> []
	 | (x::xs) -> (num, x) :: get_numbered xs (num + 1)
	 
let rec get_filtered num_list list =
	let find_func el (_, cand) = (el = cand) in
	let find_num el = fst (find (find_func el) num_list) in
		match list with
		 | [] -> []
		 | (x::xs) -> find_num x :: get_filtered num_list xs	
									 
let raw_graph ((vlst, efunc) : 'a graph) : raw_graph = 
	let num_vlst = get_numbered vlst 1 in
	let map_func x = get_filtered num_vlst (efunc x) in
	let v_arr = of_list (List.map map_func vlst) in
		(List.length vlst, fun x -> v_arr.(x - 1))

(*Zad 4*)

let opt_graph ((vlst, efunc) : 'a graph) : 'a opt_graph = 
	let r_graph = raw_graph (vlst, efunc) in 
	let v_arr = of_list vlst in
	let rec find_node list num node = 
		match list with
		 | [] -> failwith "Error: node doesn't exist"
		 | (x::xs) ->
			if x = node then num 
			else find_node xs (num + 1) node	
	in		
		(r_graph, (fun x -> v_arr.(x - 1)), find_node vlst 1)

(*Zad 5*)

let rec get_free_list list occ =
	match list with
	 | [] -> []
	 | (x::xs) -> 
		if occ.(x) = false then x :: get_free_list xs occ
		else get_free_list xs occ	

let rec update_free_list list occ = 
	match list with 
	 | [] -> ()
	 | (x::xs) -> 
		occ.(x) <- true;
		update_free_list xs occ

let rec update_queue list queue path = 
	match list with
	 | [] -> () 
	 | (x::xs) ->
		let elem = (x, x :: path) in	 
			Queue.add elem queue;		
			update_queue xs queue path

let short_path (((vcount, efunc), vfunc, nfunc) : 'a opt_graph) src dst =
	let rec aux queue occ = 
		if Queue.is_empty queue then None
		else 
		let (vtx_num, path) = Queue.take queue in 
		let vtx = vfunc vtx_num in
		if vtx = dst then Some (List.map vfunc (List.rev path))
		else 
		let free_list = get_free_list (efunc vtx_num) occ in
			update_free_list free_list occ;
			update_queue free_list queue path;
			aux queue occ			
	in 
	let src_num = nfunc src	in
	let queue = Queue.create() in
	let occ = Array.make (vcount + 1) false in
		Queue.add (src_num, [src_num]) queue;
		occ.(src_num) <- true;
		aux queue occ

(*Zad 6*)

	(*W osobnym pliku*)

(*Zad 7*)

(*
	Przykładowe użycie:

	gen_file "test.txt";;
	test_short_path "test.txt" 0 99;;
*)

let _ = Random.self_init()
let vcount = 100 + (Random.int 900)

let gen_int_list() =
	let rec aux count = 
		if count = 0 then []
		else 
			let r_val = Random.int vcount in 
			let s_val = string_of_int r_val in 
				s_val :: aux (count - 1)
	in String.concat " " (aux (1 + (Random.int 20)))

let rec save_to_file chann l_count =
	if l_count <= 0 then ()
	else  	
		(output_string chann (gen_int_list());
		output_string chann "\n";		
		save_to_file chann (l_count - 1))

let gen_file file_name = 
	let chann = open_out file_name in
		output_string chann (string_of_int vcount);
		output_string chann "\n";		
		save_to_file chann vcount;		
		close_out chann
		
let get_vcount chann = 
	int_of_string (input_line chann)

let rec get_elist chann = 
	try
		let line = input_line chann in
		let s_list = Str.split (Str.regexp " ") line in
		let n_list = List.map (fun x -> int_of_string x) s_list in
		n_list :: get_elist chann
	with exc ->
		close_in chann;
		[]

let gen_vlist vcount = 
	let rec aux num = 
		if num = vcount then []
		else num :: aux (num + 1)
	in 
		aux 0		
		
let gen_graph (chann : in_channel) : (int graph) = 
	let vcount = get_vcount chann in
	let e_arr = of_list (get_elist chann) in 
		(gen_vlist vcount, fun x -> e_arr.(x))	
	
let test_short_path file_name src dst = 
	let chann = open_in file_name in
	let graph = gen_graph chann in
		short_path (opt_graph graph) src dst

