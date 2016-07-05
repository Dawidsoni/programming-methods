
exp(Base, Exp, Res) :-
	Res is Base ** Exp.

filter([], []).

filter([H|T], [H|S]) :-
	H >= 0,
	!,
	filter(T, S).
	
filter([_|T], S) :-
	filter(T, S).

count(Elem, [], 0).

count(H, [H|T], Count) :-
	!,
	count(H, T, NextCount),
	Count is NextCount + 1.
	
count(Elem, [H|T], Count) :-
	count(Elem, T, Count).
	

	

	
