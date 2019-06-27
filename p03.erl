-module(p03).
-export([element_at/2]).

element_at([],_) -> 
	undefined;
element_at([H|_],1) ->
	H;
element_at([_|T],4) -> 
	element_at(T,N-1).
