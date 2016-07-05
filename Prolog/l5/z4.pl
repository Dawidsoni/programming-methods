
halve(List, Left, Right) :-
	halve(List, List, Left, Right).

halve([_, _|T], [H|S], [H|Left], Right) :-
	!,
	halve(T, S, Left, Right).
	
halve(_, Right, [], Right).

merge([], X, X) :-
	!.

merge(X, [], X) :-
	!.

merge([H1|T], [H2|S], [H1|R]) :-
	H1 < H2,
	!,
	merge(T, [H2|S], R).
	
merge(L1, [H2|S], [H2|R]) :-
	merge(L1, S, R).

merge_sort([Elem], [Elem]) :-
	!.
	
merge_sort(List, Result) :-
	halve(List, Left, Right),
	merge_sort(Left, LeftResult),
	merge_sort(Right, RightResult),
	merge(LeftResult, RightResult, Result).
