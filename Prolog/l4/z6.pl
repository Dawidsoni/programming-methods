
sublist([], []).

sublist([H|T], [H|S]) :-
	sublist(T, S).
	
sublist([_|T], S) :-
	sublist(T, S).

concat_number(List, Number) :-
	concat_number(List, 0, Number).
	
concat_number([], Res, Res).

concat_number([H|T], Acc, Res) :-
	NextAcc is Acc * 10 + H,
	concat_number(T, NextAcc, Res).

solution(A, C, E, P, R, S, U) :-
	sublist([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], Sublist),
	length(Sublist, 7),
	permutation(Sublist, Permlist),
	[A, C, E, P, R, S, U] = Permlist,
	\+ U = 0,
	\+ P = 0,
	concat_number([U, S, A], Usa),
	concat_number([U, S, S, R], Ussr),
	concat_number([P, E, A, C, E], Peace),
	Peace is Usa + Ussr.
		
	
