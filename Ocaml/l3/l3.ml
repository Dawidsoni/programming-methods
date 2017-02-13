include List;;

(*Zad 1*)

let rec unfoldr func input = 
	match func input with
	 | Some (output, elem) -> 
		elem :: unfoldr func output
	 | None -> []

(*Zad 2*)

let rev init_list = 
	let rec aux acc list = 
		match list with
		 | [] -> acc
		 | hd :: tl -> aux (hd :: acc) tl 		
	in aux [] init_list	

let scanl func init_val init_list = 
	let rec aux acc cur_val list = 
		match list with
		 | [] -> acc
		 | hd :: tl -> 
			let next_val = func cur_val hd
			in aux (next_val :: acc) next_val tl		
	in rev (aux [init_val] init_val init_list)


(*Zad 3*)

let scanr func init_list init_val =
	let rec aux acc cur_val list =
		match list with
		 | [] -> acc
		 | hd :: tl ->
			let next_val = func hd cur_val 
			in aux (next_val :: acc) next_val tl		
	in aux [init_val] init_val (rev init_list)

(*Zad 4*)

let reverse = 
	fold_left (fun acc x -> x :: acc) []
	
(*Zad 5*)

let map func list = 
	fold_right (fun x acc -> func x :: acc) list []
	
(*Zad 6*)

let all func list = 
	let acc_func acc x =
		if func x then acc else false
	in fold_left acc_func true list
	
(*Zad 7*)

let any func list = 
	let acc_func acc x =
		if func x then true else acc
	in fold_left acc_func false list
	
let any2 func list = 
	try
		let acc_func acc x =
			if func x then failwith "True" else acc
		in fold_left acc_func false list
	with exc -> true
	
(*Zad 8*)

type aritm_literal =
	| Neg
	| Add
	| Sub
	| Mul
	| Div
	| Pow
	| Num of float
	
(*Zad 9*)

exception TooFewOperations
exception TooManyOperations
exception IllegalOperation of 
	(aritm_literal * float * float)

let acc_neg stack = 
	match stack with
	 | [] -> raise TooManyOperations
	 | hd :: tl -> (-.hd) :: tl	

let acc_bin stack x = 
	match stack with 
	 | [] -> raise TooManyOperations
	 | [_] -> raise TooManyOperations
	 | op2 :: op1 :: tl -> 
		if (x = Div && op2 = 0.0) ||
		   (x = Pow && op1 = 0.0 && op2 = 0.0) ||
		   (x = Pow && op1 < 0.0 && op2 <> 0.0 && 
			op2 > -1.0 && op2 < 1.0)
     	then raise (IllegalOperation (x, op1, op2)) 
		else
			match x with
			 | Add -> (op1 +. op2) :: tl
			 | Sub -> (op1 -. op2) :: tl
			 | Mul -> (op1 *. op2) :: tl
			 | Div -> (op1 /. op2) :: tl
			 | Pow -> (op1 ** op2) :: tl

let eval_rpn list = 
	let acc_func stack x =
		match x with
		 | Num num -> num :: stack
		 | Neg -> acc_neg stack	
		 | _ -> acc_bin	stack x
	in let result = fold_left acc_func [] list
	in match result with
	 | [num] -> num
	 | _ -> raise TooFewOperations
	
	
	
	

	
	
	



