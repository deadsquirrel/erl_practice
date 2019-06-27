-module (p14).
-author("yanki").

-import(io,[format/2]).
-export([duplicate/1]).

duplicate(List) ->
	duplicate(List, []).

duplicate([], NewList) ->
	reverse(NewList,[]);
duplicate([H|T], NewList) ->
	duplicate(T, [H|[H|NewList]]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
