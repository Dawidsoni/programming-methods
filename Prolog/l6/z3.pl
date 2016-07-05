
insert(leaf, Value, node(leaf, Value, leaf)).

insert(node(Left, NodeVal, Right), Value, node(ResLeft, NodeVal, Right)) :-
	Value < NodeVal,
	!,
	insert(Left, Value, ResLeft).
	
insert(node(Left, NodeVal, Right), Value, node(Left, NodeVal, ResRight)) :-
	insert(Right, Value, ResRight).


	
find(node(_, Value, _), Value) :-
	!.

find(node(Left, NodeVal, _), Value) :-
	Value < NodeVal,
	!,
	find(Left, Value).
	
find(node(_, _, Right), Value) :-
	find(Right, Value).
	

findMax(node(_, Value, leaf), Value) :-
	!.

findMax(node(_, _, Right), Result) :-
	findMax(Right, Result).
	

empty(leaf).



delMax(node(Left, Value, leaf), Value, Left) :- 
	!.
	
delMax(node(Left, Value, Right), Result, node(Left, Value, ResRight)) :-
	delMax(Right, Result, ResRight).
	


del(node(Left, NodeVal, Right), Value, node(LeftResult, NodeVal, Right)) :-
	Value < NodeVal, 
	!,
	del(Left, Value, LeftResult).

del(node(Left, NodeVal, Right), Value, node(Left, NodeVal, RightResult)) :-
	Value > NodeVal, 
	!,
	del(Right, Value, RightResult).
	
del(node(Left, Value, Right), Value, Result) :-
	del(node(Left, Value, Right), Result).

del(node(Left, _, leaf), Left) :- 
	!.
	
del(node(Left, _, Right), node(Left, SubVal, SubResult)) :-
	Right = node(_, SubVal, _),
	del(Right, SubResult).
	
	
	
	
	

	
	
	
	
	
	
	
	
	




	
	
	
