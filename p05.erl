-module(p05).
-include_lib("eunit/include/eunit.hrl").
-export([reverse/1]).

reverse([]) ->
    [];
reverse([H|[]]) ->
    [H];
reverse([H|T]) ->
	reverse(T,[H]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).

reverse_nil_test() -> [] = p05:reverse([]).
reverse_one_test() -> [1] = p05:reverse([1]).
reverse_two_test() -> [2,1] = p05:reverse([1,2]).
