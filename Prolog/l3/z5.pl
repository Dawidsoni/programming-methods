
insert([], Elem, [Elem|[]]).

insert([H|T], Elem, [H|Res]) :-
	Elem > H,
	!,
	insert(T, Elem, Res).
	
insert([H|T], Elem, [Elem, H|T]).
	
ins_sort([], []).
	
ins_sort([H|T], Result) :-
	ins_sort(T, S),
	insert(S, H, Result).

	
	
