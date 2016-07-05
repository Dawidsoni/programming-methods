
insert(leaf, Val, node(leaf, Val, leaf)).

insert(node(Left, TreeVal, Right), Val, node(LeftResult, TreeVal, Right)) :-
	TreeVal >= Val,
	!,
	insert(Left, Val, LeftResult).
	
insert(node(Left, TreeVal, Right), Val, node(Left, TreeVal, RightResult)) :-
	insert(Right, Val, RightResult).

flatten(leaf, []).

flatten(node(Left, Val, Right), Result) :-
	flatten(Left, LeftResult),
	flatten(Right, RightResult),
	append(LeftResult, [Val|RightResult], Result).
	
	
treeSort(List, SortedList) :-
	treeSort(List, leaf, Tree),
	flatten(Tree, SortedList).
	
treeSort([], Tree, Tree).

treeSort([H|T], Acc, Res) :-
	insert(Acc, H, NextAcc),
	treeSort(T, NextAcc, Res).
	
	
