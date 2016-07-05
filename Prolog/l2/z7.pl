perm([], []).

perm(X, [H|T]) :-
	select(H, X, Z),
	perm(Z, T).
	
	
