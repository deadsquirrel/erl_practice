-module(p04).
-export([len/1]).

len([]) ->
	0;
len(L) ->
	len(L,1).

len([_H|[]],N) -> 
	N+1;
len([_H|T],N) -> 
	len(T,N+1).
