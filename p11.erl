-module (p11).
-author("yanki").

-export([encode_modified/1]).

encode_modified(List) ->
	encode_modified(List,1, []).
	
encode_modified([Y|[]],K, LongList) ->
	reverse([{K,Y}|LongList], []);
encode_modified([H,H|T], K, LongList) ->
	encode_modified([H|T], K+1, LongList);
encode_modified([H,Y|T], 1, LongList) ->
	encode_modified([Y|T], 1,[H|LongList]);
encode_modified([H,Y|T], K, LongList) ->
	encode_modified([Y|T], 1,[{K,H}|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
