-module(p05).
-export([reverse/1]).

reverse([H|T]) ->
	reverse(T,[H]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).

