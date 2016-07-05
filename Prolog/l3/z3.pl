factorial(0, 1) :-
	!.

factorial(Number, Result) :- 
	Num is Number - 1,
	factorial(Num, Res),
	Result is Res * Number.
	
concat_number(Digits, Num) :-
	concat_number(Digits, 0, Num).
	
concat_number([], Acc, Acc).

concat_number([H|T], Acc, Res) :-
	NextAcc is Acc * 10 + H,
	concat_number(T, NextAcc, Res).
	
decimal(Num, Digits) :-
	decimal(Num, [], Digits).
	
decimal(0, Acc, Acc).

decimal(Num, Acc, Res) :-
	NextAcc is Num mod 10,
	NextNum = Num // 10,
	decimal(NextNum, [NextAcc|Acc], Res).

