nie_smok(X) :-
	mieszka_w_zoo(X), 
	szczesliwy(X).

szczesliwy(X) :-
	zwierze(X),
	czlowiek(Y),
	mily(Y),
	styka_sie(X, Y).
	
mily(X) :-
	czlowiek(X),
	odwiedza_zoo(X).
	
styka_sie(X, Y) :-
	zwierze(X),
	mieszka_w_zoo(X),
	czlowiek(Y),
	odwiedza_zoo(Y).
	
szczesliwy(X) :-
	smok(X).
	

	
