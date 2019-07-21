-module(compare).
-export([create/0,
		update/0]).
		
create() ->
	{Time4Map, V1} = timer:tc(fun() -> crmap(), create_map end),
	io:format("~p s -- ~p~n", [Time4Map, V1]),
	{Time4prop, V2} = timer:tc(fun() -> crprop(), create_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V2]),
	{Time4dict, V3} = timer:tc(fun() -> crdict(), create_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V3]),
	{Time4ets, V4} = timer:tc(fun() -> crets(), create_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V4]).

update() ->
	{Time4Map, V10} = timer:tc(fun() -> updmap(), update_map end),
	io:format("~p s -- ~p~n", [Time4Map, V10]),
	{Time4prop, V20} = timer:tc(fun() -> updprop(), update_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V20]),
	{Time4dict, V30} = timer:tc(fun() -> upddict(), update_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V30]),
	{Time4ets, V40} = timer:tc(fun() -> updets(), update_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V40]).

updmap()->
	repeats(maps:new(), 10000).

updprop()->
	repeats([{key1,val1}|{}], 10000).
	
upddict()->
	repeats(dict:store(key1,"value1",dict:new()), 10000).
	
updets()->
	repeats(ets:new(my_ets, []), 10000).


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

	
