-module (bs01).
-author("yanki").

-export([firstword/1]).

firstword(Bin) ->
         firstword(Bin, <<>>).
         
firstword(<<" ",_Rest/binary>>, Acc) ->
    Acc;
firstword(<<C/utf8, Rest/binary>>, Acc) ->
    firstword(Rest, <<Acc/binary, C/utf8>>);
firstword(<<>>,Acc) ->
    Acc.

