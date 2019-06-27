-module (p07).
-author("yanki").

-export([flatten/1]).

flatten(List) ->
	flatten(List, [], []).

flatten([], NewList, []) ->
	reverse(NewList,[]);
flatten([], NewList, [H|T]) ->
	flatten(T, [H|NewList], []);
flatten([[]|T], NewList, _N) ->
	flatten(T, NewList, T);
flatten([A|T], NewList, _N) when is_list(A)->
	flatten(A, NewList, T);
flatten([H|T],NewList, N) ->
	flatten(T,[H|NewList], N).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
