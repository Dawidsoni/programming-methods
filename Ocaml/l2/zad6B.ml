include Flbt;;
open Flbt;;

(*
	export OCAMLRUNPARAM='l=$1'
	ocamlc -o zad6B.out "Flbt.ml" "zad6B.ml"
	ocamlrun zad6B.out
	output: 800
*)

Printf.printf "Sum: %d" (sum_t (t_right1 800))

