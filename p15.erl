-module (p15).
-author("yanki").

-import(io,[format/2]).
-export([replicate/2]).

replicate(List, N) ->
	replicate(List, N, []).

replicate([], _, NewList) ->
	reverse(NewList, []);
replicate([H|T], N, NewList) ->
	M = mult(H, N, []),
	replicate(T, N, M++NewList).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).

mult(_,0,List) ->
	List;
mult(H, N, List) -> 
	mult(H, N-1, [H|List]).
