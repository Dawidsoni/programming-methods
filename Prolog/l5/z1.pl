
app(List1-List2, List2-Tail2, List1-Tail2).

toDiffList([], X-X).

toDiffList([H|T], [H|S]-X) :-
	toDiffList(T, S-X).
	
appn(List, Result) :-
	toDiffList(List, DiffList),
	appn(DiffList, [], Result-[]).
	
appn([], Result, Result).

appn([H|T], Acc, Result) :-
	app(Acc, H, NextAcc),
	appn(T, NextAcc, Result).
	

