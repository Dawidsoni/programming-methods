include Pervasives
include String
include Str
include List

(*
	Przykładowe użycie:
	
	ocaml str.cma zad6.ml strings.txt [ab]c+d
*)

let rec read_file chann =
	try
		let line = input_line chann in
			line :: read_file chann
	with exc ->
		close_in chann;
		[]

let get_match_list list regex = 
	let filter_func text = 
		try 
			let _ = search_forward regex text 0 in
				true			
		with exc -> 
			false	
	in
		filter filter_func list

let rec show_match_list list = 
	match list with 
	 | [] -> ()
	 | (x::xs) -> 
		Printf.printf "%s\n" x;
		let line = read_line() in		
			if line = "c" then ()
			else show_match_list xs 

let () = 
	let file_name = Sys.argv.(1)
	and regex = regexp Sys.argv.(2) in
	let chann = open_in file_name in
	let text_list = read_file chann in
	let match_list = get_match_list text_list regex in
		show_match_list (List.rev match_list)

