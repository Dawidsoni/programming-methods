sasiad(A, B) :-
	A = 1, B = 2.
	
sasiad(A, B) :-
	A = 2, B = 3.
	
sasiad(A, B) :-
	A = 3, B = 4.
	
sasiad(A, B) :-
	A = 4, B = 5.
	
sasiad(A, B) :-
	A > B,
	sasiad(B, A).
		
dom(_, czerwony, anglik, _, _, _).

dom(_, _, hiszpan, pies, _, _).

dom(_, zielony, _, _, _, kawa).

dom(_, _, ukrainiec, _, _, herbata).

dom(A, zielony, _, _, _, _) :-
	dom(B, bialy, _, _, _, _), 
	sasiad(A, B).
	
dom(_, _, _, waz, wintson, _).

dom(_, zolty, _, _, kool, _).

dom(3, _, _, _, _, mleko).

dom(1, _, norweg, _, _, _).

dom(X, _, _, _, chesterfield, _) :-
	dom(Y, _, _, lis, _, _), 
	sasiad(X, Y).

dom(X, _, _, kon, _, _) :-
	dom(Y, _, _, _, kool, _), sasiad(X, Y).
	
dom(_, _, _, _, lucky_strike, sok).

dom(_, _, japonczyk, _, kenty, _).

dom(X, _, norweg, _, _, _) :-
	dom(Y, niebieski, _, _, _, _),
	sasiad(X, Y).
	
	
abc(a, b, c, d, _, f).


