-module (p08).
-author("yanki").

-export([compress/1]).

compress(List) ->
	compress(List, []).
	
compress([H|[]],NewList) ->
	reverse([H|NewList], []);
compress([H,H|T], NewList) ->
	compress([H|T], NewList);
compress([H,Y|T],NewList) ->
	compress([Y|T],[H|NewList]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).
