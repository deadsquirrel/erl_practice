-module (p10).
-author("yanki").

-import(io, [format/2]).
-export([pack/1]).

pack(List) ->
	pack(List,0, []).
	
pack([Y|[]],K, LongList) ->
	reverse([{K,Y}|LongList], []);
pack([H,H|T], K,LongList) ->
	pack([H|T], K+1, LongList);
pack([H,Y|T],K, LongList) ->
	pack([Y|T],1,[{K,H}|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
