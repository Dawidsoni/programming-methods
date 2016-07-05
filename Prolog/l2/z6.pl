sublist([], []).

sublist([H|T], R) :-
	sublist(T, S),
	(R = [H|S]; R = S).
	
