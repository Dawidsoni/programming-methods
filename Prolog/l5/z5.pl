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

aboveList(X, 0, X) :- 
	!.

aboveList([_|T], Counter, R) :-
	NextCounter is Counter - 1,
	aboveList(T, NextCounter, R).

merge_sort(List, Result) :-
	length(List, ListLength),
	merge_sort(List, ListLength, Result).
	
merge_sort([H|_], 1, [H]) :-
	!.
	
merge_sort(List, Count, Result) :-
	Below is Count // 2,
	Above is Count - Below,
	aboveList(List, Below, AboveList),
	merge_sort(List, Below, SortedLeft),
	merge_sort(AboveList, Above, SortedRight),
	merge(SortedLeft, SortedRight, Result).	
