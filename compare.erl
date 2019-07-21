-module(compare).
-export([create/0]).
		
create() ->
	{Time4Map, V1} = timer:tc(fun() -> crmap(), create_map end),
	io:format("~p s -- ~p~n", [Time4Map, V1]),
	{Time4prop, V2} = timer:tc(fun() -> crprop(), create_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V2]),
	{Time4dict, V3} = timer:tc(fun() -> crdict(), create_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V3]),
	{Time4ets, V4} = timer:tc(fun() -> crets(), create_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V4]).

crmap()->
	repeats(maps:new(), 10000).

repeats(Inp, 0) ->
	Inp;
repeats(Inp, N) ->
	repeats(Inp, N-1).

crprop() ->
	repeats([{}], 10000).

crdict() ->
	repeats(dict:new(), 10000).

crets() ->
	repeats(ets:new(my_ets, []), 10000).

	
