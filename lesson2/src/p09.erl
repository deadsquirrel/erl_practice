-module (p09).
-author("yanki").

-import(io, [format/2]).
-export([pack/1]).

pack(List) ->
	pack(List, [], []).
	
pack([H|[]],NewList, LongList) ->
	reverse([[H|NewList]|LongList], []);
pack([H,H|T], NewList,LongList) ->
	pack([H|T], [H|NewList], LongList);
pack([H,Y|T],NewList, LongList) ->
	pack([Y|T],[],[[H|NewList]|LongList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
