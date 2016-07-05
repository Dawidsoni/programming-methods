
putStack(Elem, Stack, [Elem|Stack]).

getStack([Elem|Tail], Elem, Tail).

emptyStack([]).

addAllStack(Elem, Goal, Stack, NewStack) :-
	findall(Elem, Goal, ElemList),
	append(ElemList, Stack, NewStack).


putQueue(Elem, Queue-X, Result) :-
	X = [Elem|Y],
	Result = Queue-Y.
	
getQueue([Head|Tail]-X, Head, Tail-X).

emptyQueue(X-X).

app(List1-List2, List2-Tail, List1-Tail).

addAllQueue(Elem, Goal, Queue, NewQueue) :-
	findall(Elem, Goal, List, Tail),
	app(Queue, List-Tail, NewQueue).
	
	
