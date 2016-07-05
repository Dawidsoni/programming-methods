ptak(_) :- false.
dzdzownica(_) :- false.
ryba(_) :- false.
kot(my_cat).

lubi(X, Y) :- ptak(X), dzdzownica(Y).
lubi(X, Y) :- kot(X), ryba(Y).
lubi(X, Y) :- przyjaciele(X, Y).
lubi(X, Y) :- przyjaciele(Y, X).
przyjaciele(me, my_cat).
zjada(my_cat, X) :- lubi(my_cat, X).

