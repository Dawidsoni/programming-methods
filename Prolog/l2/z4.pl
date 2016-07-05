even([]).

even([_, _ | T]) :-
	even(T).

sing([_|[]]).

palindrom(X) :-
	reverse(X, X).
