-module(compare).
-export([create/0]).
-export([update/0]).
-export([lookup/0]).
-export([comparetest/0]).
		
comparetest() ->
	create(),
	update(),
	lookup().
	
create() ->
	io:fwrite("  Creating... ~n"),
	{Time4Map, V1} = timer:tc(fun() -> crmap(), create_map end),
	io:format("~p s -- ~p~n", [Time4Map, V1]),
	{Time4prop, V2} = timer:tc(fun() -> crprop(), create_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V2]),
	{Time4dict, V3} = timer:tc(fun() -> crdict(), create_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V3]),
	{Time4prdict, V4} = timer:tc(fun() -> crprdict(), create_prdict end),
	io:format("~p s -- ~p~n", [Time4prdict, V4]),
	{Time4ets, V5} = timer:tc(fun() -> crets(), create_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V5]).

update() ->
	io:fwrite("  Updating... ~n"),
	{Time4Map, V10} = timer:tc(fun() -> updmap(), update_map end),
	io:format("~p s -- ~p~n", [Time4Map, V10]),
	{Time4prop, V20} = timer:tc(fun() -> updprop(), update_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V20]),
	{Time4dict, V30} = timer:tc(fun() -> upddict(), update_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V30]),
	{Time4prdict, V40} = timer:tc(fun() -> updprdict(), update_procdict end),
	io:format("~p s -- ~p~n", [Time4prdict, V40]),
	{Time4ets, V50} = timer:tc(fun() -> updets(), update_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V50]).

lookup() ->
	io:fwrite("  Getting... ~n"),
	{Time4Map, V100} = timer:tc(fun() -> lumap(), lookup_map end),
	io:format("~p s -- ~p~n", [Time4Map, V100]),
	{Time4prop, V200} = timer:tc(fun() -> luprop(), lookup_prop end),
	io:format("~p s -- ~p~n", [Time4prop, V200]),
	{Time4dict, V300} = timer:tc(fun() -> ludict(), lookup_dict end),
	io:format("~p s -- ~p~n", [Time4dict, V300]),
	{Time4prdict, V400} = timer:tc(fun() -> luprdict(), lookup_procdict end),
	io:format("~p s -- ~p~n", [Time4prdict, V400]),
	{Time4ets, V500} = timer:tc(fun() -> luets(), lookup_ets end),
	io:format("~p s -- ~p~n", [Time4ets, V500]).
	
%%lookup 
%% у меня тут непонятки по поводу того, какие данніе мі получаем,
%% если генерим, например, пустой dict или map
lumap()->
	repeats(maps:get(key1,#{key1 => "value1", key2 => "value2"}), 10000).
luprop()->
	repeats(proplists:get_value(key1, [{key1, v1}]), 10000).
ludict() ->
	repeats(dict:fetch(key1,(dict:store(key1,"value1",dict:new()))), 10000).
luprdict() ->
	repeats(erase(put(key1,value1)), 10000).
%%здесь, например, получается время на сохдание, добавление єлемента
%% и только потом поиск єлемента
luets() ->	
	Ets=ets:new(my_ets, []),
	ets:insert(Ets, {1, "Bob", value2}),
	repeats(ets:lookup(Ets, 1), 10000).
 
%%	repeats(ets:lookup(ets:insert(ets:new(my_ets, []), {1, "Bob", value2}), 1), 10000).


%%update

updmap()->
	repeats(maps:new(), 10000).

updprop()->
	repeats([{key1,val1}|{}], 10000).
	
upddict()->
	repeats(dict:store(key1,"value1",dict:new()), 10000).
	
updets()->
	repeats(ets:new(my_ets, []), 10000).

updprdict()->
	repeats(put(key2,value2), 10000).

%%create

crprdict()->
	repeats(put(key1,value1), 10000).
	
crmap()->
	repeats(maps:new(), 10000).

repeats(Inp, 0) ->
	Inp;
repeats(Inp, N) ->
	repeats(Inp, N-1).

crprop() ->
	repeats([{key1, v1}], 10000).

crdict() ->
	repeats(dict:new(), 10000).

crets() ->
	repeats(ets:new(my_ets, []), 10000).
