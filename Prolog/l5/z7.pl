
split([], _, [], []).

split([H|T], Elem, [H|R1], R2) :-
	H < Elem,
	!, 
	split(T, Elem, R1, R2).
	
split([H|T], Elem, R1, [H|R2]) :-
	split(T, Elem, R1, R2).

qsort(List, Result) :-
	qsort(List, [], Result).
	
qsort([], Result, Result).

qsort([H|T], Acc, Result) :-
	split(T, H, BelowList, AboveList),
	qsort(AboveList, Acc, NextAcc),
	qsort(BelowList, [H|NextAcc], Result).
	
