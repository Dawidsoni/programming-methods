
make_list([_]).

make_list([_|T]) :-
	make_list(T).

fill_list([]).

fill_list([0|T]) :-
	fill_list(T).
	
fill_list([1|T]) :-
	fill_list(T).

bin([0]).

bin([1]).

bin([1|T]) :-
	make_list(T),
	fill_list(T).

rbin([0]).

rbin([1]).

rbin(List) :-
	make_list(Template),
	rfill_list(Template, [1], List).
	
rfill_list([], Res, Res).

rfill_list([0|T], Acc, Res) :-
	rfill_list(T, [0|Acc], Res).
	
rfill_list([1|T], Acc, Res) :-
	rfill_list(T, [1|Acc], Res).
	
	
	
