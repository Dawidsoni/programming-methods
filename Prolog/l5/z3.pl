
halve(List, Left, Right) :-
	halve(List, List, Left, Right).

halve([_, _|T], [H|S], [H|Left], Right) :-
	!,
	halve(T, S, Left, Right).
	
halve(_, Right, [], Right).


	
