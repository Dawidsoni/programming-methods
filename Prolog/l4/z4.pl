
mirror(leaf, leaf).

mirror(node(Left, Val, Right), Result) :-
	mirror(Left, LeftResult),
	mirror(Right, RightResult),
	Result = node(RightResult, Val, LeftResult).
	
	
flatten(leaf, []).

flatten(node(Left, Val, Right), Result) :-
	flatten(Left, LeftList),
	flatten(Right, RightList),
	append(LeftList, [Val|RightList], Result).
	
	
