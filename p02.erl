-module(p01).
-export([last/1]).

last([H,H2|[]]) ->
	[H,H2];
last([H|T]) -> 
	last(T).
