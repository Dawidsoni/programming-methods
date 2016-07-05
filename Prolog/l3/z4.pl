
select_min([M], M, []) :- 
	!.
	
select_min([K, H | T], M, [H|S]) :-
	K =< H,
	!,
	select_min([K|T], M, S).
	
select_min([K, H | T], M, [K|S]) :-
	select_min([H|T], M, S).

sel_sort([], []).
	
sel_sort(List, [H|T]) :-
	select_min(List, H, Rest),
	sel_sort(Rest, T).
	
	
