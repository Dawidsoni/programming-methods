merge([], X, X) :-
	!.

merge(X, [], X) :-
	!.

merge([H1|T], [H2|S], [H1|R]) :-
	H1 < H2,
	!,
	merge(T, [H2|S], R).
	
merge(L1, [H2|S], [H2|R]) :-
	merge(L1, S, R).

elemList(H, [H]).

merge_sort(List, Result) :-
	maplist(elemList, List, ElemList),
	merge_lists(ElemList, Result).
	
merge_lists([SortedList], SortedList) :-
	!.

merge_lists(List, SortedList) :-
	pair_list(List, NextList),
	merge_lists(NextList, SortedList).
	
pair_list([H1, H2|T], [H|R]) :-
	!,
	merge(H1, H2, H),
	pair_list(T, R).
	
pair_list(List, List).

	
	
