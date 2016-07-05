
len(List, Num) :-
	len(List, 0, Num).
	
len([], Acc, Res) :-
	\+ var(Res),
	Acc = Res,
	!.
	
len([], Res, Res).
	
len([_|T], Acc, Res) :-
	NextAcc is Acc + 1,
	len(T, NextAcc, Res).
	
is_non_var(X) :-
	\+ X = a;
	\+ X = b.
	
is_var(X) :-
	\+ is_non_var(X).
	
	
