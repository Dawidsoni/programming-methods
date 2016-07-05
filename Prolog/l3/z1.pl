
perm([], []).

perm([H|T], S) :-
	perm(T, R),
	select(H, S, R).
	
	
