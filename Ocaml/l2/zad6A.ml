include Flbt;;
open Flbt;;

(*
	export OCAMLRUNPARAM='l=$1'
	ocamlc -o zad6A.out "Flbt.ml" "zad6A.ml"
	ocamlrun zad6A.out
	output: 762
*)

Printf.printf "Sum: %d" (sum_nt (t_right1 800))

