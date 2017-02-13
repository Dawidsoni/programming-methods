(* tools *)

let rec rev_app (l1 : 'a list) (l2 : 'a list) : 'a list =
    match l1 with
    | []     -> l2
    | e::l1' -> rev_app l1' (e::l2)


let int2bool (i : int) : bool = 
    i <> 0


let bool2int (b : bool) : int =
    if b then 1 else 0


let rec bin_length (i : int) : int =
    if i = 0 || abs i = 1 then 1
                          else bin_length (i / 2) + 1




(* nat library *)

(* The type for representing natural numbers in their binary form.
   The deepest element of the list corresponds to the leading
   bit of the number. The empty list and lists of the form
   ...::[false] are considered to be incorrect data. *)

type nat = bool list


let rec i2n (i : int) : nat =
    if i < 0  then [false] else
    if i <= 1 then [int2bool i]
              else int2bool(i mod 2) :: i2n(i / 2)


let nlow_int (n : nat) (d : int) : int =
    let rec aux j d =
        match j with
        | b::j' -> let j' = if d = 1 then [] else j' 
                   in
                       2 * aux j' (d-1) + bool2int b
        | []    -> 0
    in
        aux n d


let nless (n1 : nat) (n2 : nat) : bool =
    let f b1 b2 = (* f jest bardzo zla nazwa funkcji, ale
                     jest tu uzyte, zeby sprawdzic umiejetnosc
                     czytania kodu ze rozumieniem *)
        match b1, b2 with
        | false, true -> true
        | _,     _    -> false
    in 
    let rec aux n1 n2 a =
        match n1, n2 with
        | b1::n1', b2::n2' -> 
              aux n1' n2' (if b1 = b2 then a else f b1 b2)
        | [],      []      -> a
        | [],      _       -> true
        | _,       []      -> false
    in
        aux n1 n2 false

(*Zad 1*)
(*jest ogonowa*)

let nless_eq (n1 : nat) (n2 : nat) : bool =
	let comp b1 b2 =
		match b1, b2 with
		| false, true -> true
		| _, _ -> false
	in
	let rec aux n1 n2 acc =
		match n1, n2 with
		| b1::n1', b2::n2' ->
			aux n1' n2' (if b1 = b2 then acc else comp b1 b2)
		| [], [] -> acc
		| [], _ -> true
		| _, [] -> false		
	in
		aux n1 n2 true		


let nadd (n1 : nat) (n2 : nat) : nat =
    let bit_sum b1 b2 c =
        let c' = b1 && b2 || b1 && c || b2 && c in
        let b' = not c' && (b1 || b2 || c) || b1 && b2 && c
        in
            (b', c')
    in
    let rec aux n1 n2 c a =
        match n1, n2 with
        | b1::n1', b2::n2' -> let (b', c') = bit_sum b1 b2 c in
                              aux n1' n2' c' (b'::a)
        | [],      _::_    -> if c then aux [false] n2 c a
                                   else rev_app a n2
        | _::_,    []      -> if c then aux n1 [false] c a
                                   else rev_app a n1
        | [],      []      -> rev_app a (if c then [c] else [])
    in
        aux n1 n2 false []    

(*Zad 2*)

let nsub (n1 : nat) (n2 : nat) : nat =
	let bit_sub b1 b2 c = 
		let b' = (bool2int b1 + bool2int b2 + bool2int c) 
				  mod 2 = 1
		and c' = b2 && c || (not b1 && not b2 && c) 
			     || (not b1 && b2 && not c)
		in (b', c')
	in 
	let rec aux n1 n2 c acc = 
		match n1, n2 with
		| b1::n1', b2::n2' -> let (b', c') = bit_sub b1 b2 c in
							  aux n1' n2' c' (b'::acc)
		| [], [] -> if c then [false] else rev_app acc []
		| [], _ -> [false]
		| _, [] -> if c then aux n1 [false] c acc 
						else rev_app acc n1				
	in aux n1 n2 false []
	

let nmul2 (n : nat) : nat =
    false::n


let nmul2p1 (n : nat) : nat =
    true::n


let ndiv2 ((_::n') : nat) : nat =
    if n' = [] then [false] else n'


let nmod2 ((b::_) : nat) : int =
    bool2int b


let rec nilsl (n : nat) (s : int) : nat =
    if s <= 0 then n else nilsl (nmul2 n) (s-1)
