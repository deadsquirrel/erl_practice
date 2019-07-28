-module(p02).
-export([last/1]).

last([H,H2|[]]) ->
	[H,H2];
last([_H|T]) -> 
	last(T).
