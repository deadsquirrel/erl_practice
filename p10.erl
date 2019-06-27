-module (p10).
-author("yanki").

-export([encode/1]).

encode(List) ->
	encode(List,0, []).
	
encode([Y|[]],K, LongList) ->
	reverse([{K,Y}|LongList], []);
encode([H,H|T], K,LongList) ->
	encode([H|T], K+1, LongList);
encode([H,Y|T],K, LongList) ->
	encode([Y|T],1,[{K,H}|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
