-module(p06).
-export([palindrome/1]).

palindrome(L) ->
	L==reverse(L).	

reverse([H|T]) ->
	reverse(T,[H]).

reverse([H|[]],L) ->
	[H|L];
reverse([H|T],L) ->
	reverse(T,[H|L]).

