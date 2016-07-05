polaczenie(wroclaw, warszawa).
polaczenie(wroclaw, krakow).
polaczenie(wroclaw, szczecin).
polaczenie(szczecin, lublin).
polaczenie(szczecin, gniezno).
polaczenie(warszawa, katowice).
polaczenie(gniezno, gliwice).
polaczenie(lublin, gliwice).

polaczenie(wroclaw, lublin).
polaczenie(wroclaw, X).
polaczenie(A, B), polaczenie(B, gliwice).
polaczenie(A, B), polaczenie(B, C), polaczenie(C, gliwice).

connection(A, B) :-
	polaczenie(A, B).
		
connection(A, B) :-
	polaczenie(A, C),
	connection(C, B).
	
%nie dziala dla grafow z cyklem

