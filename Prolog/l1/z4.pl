parent(A, B) :-
	true
	
male(A) :-
	true
	
female(A) :-
	true
	
sibiling(A, B) :-
	parent(C, A), 
	parent(C, B).
	
sister(A, B) :-
	parent(C, A), 
	parent(C, B),
	female(A),
	female(B).
	
grandson(A, B) :-
	parent(C, A), 
	parent(B, C)
	
cousin(A, B) :-
	parent(C, A), 
	parent(D, B), 
	sibiling(C, D).
	
descendant(A, B) :-
	parent(B, A).
	
descendant(A, B) :-
	parent(B, C),
	descendant(A, C).
	
is_mother(A) :-
	female(A), 
	parent(A, _).
	
is_father(A) :-
	male(A),
	parent(A, _).
	
parent(john, joshua).
parent(adam, helen).
parent(helen, joshua).
parent(adam, anna).
parent(eve, ivonne).
parent(eve, anna).
parent(ivone, david).
parent(mark, david).

male(john).
male(adam).
male(david).
male(mark).

female(helen).
female(joshua).
female(ivonne).
female(anna).

descendant(john, mark).
descendant(adam, X).
sister(ivone, X).
cousin(X, Y).

	
	
	

	
	

	
	
