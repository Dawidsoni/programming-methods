
rev(X, Y) :-
	rev(X, [], Y, Y).
	
rev([], X, X, []).

rev([H1|T1], Acc1, Res1, [_|T2]) :-
	rev(T1, [H1|Acc1], Res1, T2).
	
	
