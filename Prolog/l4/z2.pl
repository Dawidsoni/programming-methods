
polaczenie(wroclaw, warszawa).
polaczenie(wroclaw, krakow).
polaczenie(wroclaw, szczecin).
polaczenie(szczecin, lublin).
polaczenie(szczecin, gniezno).
polaczenie(warszawa, katowice).
polaczenie(gniezno, gliwice).
polaczenie(lublin, gliwice).
polaczenie(katowice, szczecin).

trip(From, To, Result) :-
	trip(From, To, [To], Result).
	
trip(From, From, Result, Result).

trip(From, To, VisitedList, Result) :-
	polaczenie(X, To),
	\+ member(X, VisitedList),
	trip(From, X, [X|VisitedList], Result).
	
	
