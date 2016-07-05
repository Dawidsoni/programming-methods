
head(H, [H|_]).

last([H|[]], H).

last([_|T], X) :-
	last(T, X).

tail(T, [_|T]).

init([], [_|[]]).

init([H|T1], [H|T2]) :-
	init(T1, T2).

prefix([H|T], [H|T]).

prefix([], [_|_]).	
	
prefix([H|T1], [H|T2]) :-
	prefix(T1, T2).

suffix([H|T], [H|T]).

suffix(X, [_|T]) :-
	suffix(X, T).
	
