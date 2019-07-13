-module(fibo_tests).
-include_lib("eunit/include/eunit.hrl").
 
%%TEST%%
math_test() ->
	1 = fibo:math(0),
	1 = fibo:math(1),
	2 = fibo:math(2),
	3 = fibo:math(3),
	5 = fibo:math(4),
	8 = fibo:math(5),
	2178309 = fibo:math(31).
