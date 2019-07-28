-module(p06_tests).
-include_lib("eunit/include/eunit.hrl").
 
%%TEST%%

palindrome_test_() ->
	[test_them_types(),
	test_them_values()].
 
test_them_types() ->
	?_assert(is_list(p06:palindrome([1,2,1]))).
 
test_them_values() ->
	?_assertEqual([1,2,1], (p06:palindrome([1,2,1]))),
	?_assertEqual([a,b,b,a], (p06:palindrome([a,b,b,a]))),
	?_assertEqual([1,2,3,3,2,1], (p06:palindrome([1,2,3,3,2,1]))).

palindrome_test() ->
	[] = p06:palindrome([]),
	[1] = p06:palindrome([1]),
	[2,2,2] = p06:palindrome([2,2,2]),
	[3,2,2,2,3] = p06:palindrome([3,2,2,2,3]),
	[4,f,4] = p06:palindrome([4,f,4]),
	[5] = p06:palindrome([5]),
	[31] = p06:palindrome(31).

new_palindrome_test() ->
	?assertEqual([], p06:palindrome([])),
	?assertEqual([1,2,1], p06:palindrome([1,2,1])),
	?assert(is_list(p06:palindrome([s]))),
	?assertEqual(s, p06:palindrome(s)).

