-module (p12).
-author("yanki").

-export([decode_modified/1]).

decode_modified([H|T]) ->
	decode_modified([H|T], []).

	
decode_modified([],  LongList) ->
	reverse(LongList, []);
decode_modified([H|T], LongList) when not is_tuple(H) ->
	decode_modified(T, [H|LongList]);
decode_modified([{0,_H}|T], LongList) ->
	decode_modified(T, LongList);
decode_modified([{K,H}|_T],  LongList) ->
	decode_modified([{K-1,H}|_T], [H|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).