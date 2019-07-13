-module(fibo).
-export([nachi/1]).

nachi(0) -> 1;
nachi(1) -> 1;
nachi(N) when N > 1 -> nachi(N-1) + nachi(N-2).
