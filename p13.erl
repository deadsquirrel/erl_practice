-module (p13).
-author("yanki").

-export([decode/1]).

decode([H|T]) ->
	decode([H|T], []).
	
decode([],  LongList) ->
	reverse(LongList, []);
decode([{0,_H}|T], LongList) ->
	decode(T, LongList);
decode([{K,H}|_T],  LongList) ->
	decode([{K-1,H}|_T], [H|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).