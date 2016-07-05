
appd(List1-List2, List2-Tail2, List1-Tail2).

flatten(List, Result) :-
	flatt(List, Result-[]).
	
flatt(List, Result) :-
	is_list(List), 
	!,
	flatt(List, X-X, Result).
	
flatt(Elem, [Elem|X]-X).

flatt([], Result, Result).

flatt([H|T], Acc, Result) :-
	flatt(H, Sublist),
	appd(Acc, Sublist, NextAcc),
	flatt(T, NextAcc, Result).
	
	
